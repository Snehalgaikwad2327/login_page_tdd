// ignore_for_file: unnecessary_null_comparison

import 'package:dartz/dartz.dart';
import 'package:flutter_login_page/core/error/exception.dart';
import 'package:flutter_login_page/feature/login_page/data/dataSources/user_details_local_data_source.dart';
import 'package:flutter_login_page/feature/login_page/data/models/user_details-model.dart';
import 'package:flutter_login_page/feature/login_page/domain/entities/user_details.dart';
import 'package:flutter_login_page/feature/login_page/domain/repositories/user_details_repositories.dart';

import '../../../../core/error/failure.dart';

class UserDetailsRepositoryImpl implements UserDetailsRepository {
  final UserDetailsLocalDataSource localDataSource;

  UserDetailsRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, bool>> checkLoginData(
      String emailId, String password) async {
    try {
      return Right(await localDataSource.checkLoginData(emailId, password));
    } on CacheException {
      throw Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserDetails>> getUserDetails() async {
    try {
      return Right(await localDataSource.getUserDetails());
    } on CacheException {
      throw Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> isRemember() async {
    try {
      return Right(await localDataSource.isRemember());
    } on CacheException {
      throw Left(CacheFailure());
    }
  }

  @override
  Future setRememberData(bool value) async {
    try {
      return await localDataSource.setRememberData(value);
    } on CacheException {
      throw Left(CacheFailure());
    }
  }

  @override
  Future setUserDetails(UserDetails userDetails) async {
    try {
      return await localDataSource.setUserDetails(UserDetailsModel(
          name: userDetails.name,
          age: userDetails.age,
          emailId: userDetails.emailId,
          password: userDetails.password));
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getScreenName() async {
    try {
      return Right(await localDataSource.getScreenName());
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future setScreenName(String screenName) async {
    try {
      return await localDataSource.setScreenName(screenName);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
