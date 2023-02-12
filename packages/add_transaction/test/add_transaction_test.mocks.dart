// Mocks generated by Mockito 5.3.2 from annotations
// in add_transaction/test/add_transaction_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:add_transaction/business/data_source/add_transaction_service.dart'
    as _i3;
import 'package:add_transaction/business/dto/transaction_dto.dart' as _i5;
import 'package:add_transaction/business/repository/add_transaction_repository.dart'
    as _i6;
import 'package:common/common.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeFirebaseResponse_0 extends _i1.SmartFake
    implements _i2.FirebaseResponse {
  _FakeFirebaseResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AddTransactionService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddTransactionService extends _i1.Mock
    implements _i3.AddTransactionService {
  MockAddTransactionService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.FirebaseResponse> addTransaction(
          _i5.TransactionDTO? transactionDTO) =>
      (super.noSuchMethod(
        Invocation.method(
          #addTransaction,
          [transactionDTO],
        ),
        returnValue:
            _i4.Future<_i2.FirebaseResponse>.value(_FakeFirebaseResponse_0(
          this,
          Invocation.method(
            #addTransaction,
            [transactionDTO],
          ),
        )),
      ) as _i4.Future<_i2.FirebaseResponse>);
}

/// A class which mocks [AddTransactionRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddTransactionRepository extends _i1.Mock
    implements _i6.AddTransactionRepository {
  MockAddTransactionRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.FirebaseResponse> addTransaction(
          _i5.TransactionDTO? transactionDTO) =>
      (super.noSuchMethod(
        Invocation.method(
          #addTransaction,
          [transactionDTO],
        ),
        returnValue:
            _i4.Future<_i2.FirebaseResponse>.value(_FakeFirebaseResponse_0(
          this,
          Invocation.method(
            #addTransaction,
            [transactionDTO],
          ),
        )),
      ) as _i4.Future<_i2.FirebaseResponse>);
}
