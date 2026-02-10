import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/error/failures.dart';

abstract interface class AssignmentRepository {
  Future<Either<Failure, String>> getAssignmentPdf({required String url});
}

@Injectable(as: AssignmentRepository)
class AssignmentRepositoryImpl implements AssignmentRepository {
  final Dio _dio;

  AssignmentRepositoryImpl(this._dio);

  @override
  Future<Either<Failure, String>> getAssignmentPdf({
    required String url,
  }) async {
    try {
      final appDocDir = await getApplicationDocumentsDirectory();

      // Simple hash-like filename from URL
      final fileName = 'assignment_${url.split('/').last}';
      final filePath = '${appDocDir.path}/$fileName';
      final file = File(filePath);

      if (await file.exists()) {
        return Right(filePath);
      }

      // Download if not exists
      await _dio.download(url, filePath);

      return Right(filePath);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
