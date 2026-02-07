import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions/responsive_extensions.dart';
import '../models/video_item_model.dart';
import '../repositories/video_repository.dart';

/// Production-ready full-screen video viewer with swiper
/// Optimized for performance with proper state management
@RoutePage()
class VideoViewerPage extends StatefulWidget {
  final String videoAlbumId;
  final int initialIndex;
  final List<VideoItemModel>? videos; // Optional: if provided, use directly

  const VideoViewerPage({
    super.key,
    required this.videoAlbumId,
    required this.initialIndex,
    this.videos,
  });

  @override
  State<VideoViewerPage> createState() => _VideoViewerPageState();
}

class _VideoViewerPageState extends State<VideoViewerPage> {
  late PageController _pageController;
  late int _currentIndex;
  bool _showControls = true;
  List<VideoItemModel>? _videos;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    
    // Use provided videos or load them
    if (widget.videos != null) {
      _videos = widget.videos;
    } else {
      _loadVideos();
    }
  }

  Future<void> _loadVideos() async {
    setState(() => _isLoading = true);
    try {
      final repository = MockVideoRepository();
      // Load all videos - for viewer, we load in larger batches
      // In production, this would be handled differently (maybe load all at once or implement pagination in viewer)
      final videos = await repository.getVideos(
        videoAlbumId: widget.videoAlbumId,
        page: 1,
        pageSize: 1000, // Load a large batch for viewer
      );
      if (mounted) {
        setState(() {
          _videos = videos;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    // Only update state if index actually changed to prevent unnecessary rebuilds
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading || _videos == null) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      );
    }

    if (_videos!.isEmpty) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text(
            'No videos found',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.5),
              fontSize: context.scaleFont(16),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Video viewer with PageView
          GestureDetector(
            onTap: _toggleControls,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _videos!.length,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                final video = _videos![index];
                return RepaintBoundary(
                  key: ValueKey('video_viewer_${video.id}_$index'),
                  child: _VideoViewItem(video: video),
                );
              },
            ),
          ),
          // Top bar with counter and back button - only rebuilds when showControls or currentIndex changes
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: _showControls
                ? _TopBar(
                    key: const ValueKey('top_bar'),
                    currentIndex: _currentIndex,
                    totalVideos: _videos!.length,
                  )
                : const SizedBox.shrink(key: ValueKey('empty')),
          ),
        ],
      ),
    );
  }
}

/// Individual video view item
/// Optimized for performance with cached MediaQuery values
class _VideoViewItem extends StatefulWidget {
  final VideoItemModel video;

  const _VideoViewItem({required this.video});

  @override
  State<_VideoViewItem> createState() => _VideoViewItemState();
}

class _VideoViewItemState extends State<_VideoViewItem> {
  int? _memCacheWidth;
  int? _memCacheHeight;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Cache MediaQuery calculations to avoid recalculation on every build
    if (_memCacheWidth == null || _memCacheHeight == null) {
      final mediaQuery = MediaQuery.of(context);
      final pixelRatio = mediaQuery.devicePixelRatio;
      _memCacheWidth = (mediaQuery.size.width * pixelRatio).round();
      _memCacheHeight = (mediaQuery.size.height * pixelRatio).round();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Video thumbnail
          CachedNetworkImage(
            imageUrl: widget.video.thumbnailUrl ?? '',
            fit: BoxFit.contain,
            placeholder: (context, url) => Container(
              color: Colors.black,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.black,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.video_library_outlined,
                      color: Colors.white.withValues(alpha: 0.5),
                      size: context.scale(64),
                    ),
                    SizedBox(height: context.scaleHeight(16)),
                    Text(
                      'Failed to load video thumbnail',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.5),
                        fontSize: context.scaleFont(16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            memCacheWidth: _memCacheWidth,
            memCacheHeight: _memCacheHeight,
          ),
          // Play button overlay
          Center(
            child: GestureDetector(
              onTap: () {
                // TODO: Implement video playback
                // In production, this would open a video player
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Playing: ${widget.video.videoUrl}'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(context.scale(20)),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: context.scale(64),
                ),
              ),
            ),
          ),
          // Duration badge
          if (widget.video.duration != null)
            Positioned(
              bottom: context.scaleHeight(20),
              right: context.scale(20),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.scale(12),
                  vertical: context.scaleHeight(6),
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(context.scale(8)),
                ),
                child: Text(
                  widget.video.duration ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: context.scaleFont(14),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Top bar with video counter and back button
class _TopBar extends StatelessWidget {
  final int currentIndex;
  final int totalVideos;

  const _TopBar({
    super.key,
    required this.currentIndex,
    required this.totalVideos,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.scale(16),
          vertical: context.scaleHeight(12),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.7),
              Colors.transparent,
            ],
          ),
        ),
        child: Row(
          children: [
            // Back button
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => context.router.maybePop(),
            ),
            const Spacer(),
            // Video counter
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.scale(12),
                vertical: context.scaleHeight(6),
              ),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(context.scale(20)),
              ),
              child: Text(
                '${currentIndex + 1} / $totalVideos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: context.scaleFont(14),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
