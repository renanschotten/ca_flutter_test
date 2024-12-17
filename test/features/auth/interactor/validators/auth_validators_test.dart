import 'package:ca_flutter_test/features/auth/interactor/validators/auth_validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('validateEmail |', () {
    test(
      'should return true if the string is a valid email address or null',
      () {
        expect(AuthValidators.validateEmail('teste@teste.com'), true);
        expect(AuthValidators.validateEmail('abc.def@mail.com'), true);
        expect(AuthValidators.validateEmail('abc#def@mail.com'), false);
        expect(AuthValidators.validateEmail('abc.def@mail#archive.com'), false);
        expect(AuthValidators.validateEmail(null), true);
      },
    );
  });

  group('validatePassword |', () {
    test('should return true if the string is not empty or null', () {
      expect(AuthValidators.validatePassword(''), false);
      expect(AuthValidators.validatePassword('1'), true);
      expect(AuthValidators.validatePassword(null), true);
    });
  });
}
