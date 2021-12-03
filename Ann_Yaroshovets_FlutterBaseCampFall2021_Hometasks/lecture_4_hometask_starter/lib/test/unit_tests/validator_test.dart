import 'package:campnotes/validator.dart';
import 'package:test/test.dart';

void main(){
  group('Validator tests - ',(){
    group('Email validator tests -',(){
      test("When email is empty",(){
        var result = Validator.validateEmail(email: "");
        expect(result,'Email can\'t be empty');
      });
      group("When email must be wrong -",(){
        test("Email doesnt have @",(){
          var result = Validator.validateEmail(email: "test.gmail.com");
          expect(result,'Enter a correct email');
        });
        test("Email with more then 1 dots in row ",(){
          var result = Validator.validateEmail(email: "test@gmail..com");
          expect(result,'Enter a correct email');
        });
        test("Email has no domain ",(){
          var result = Validator.validateEmail(email: "test@");
          expect(result,'Enter a correct email');
        });
        test("Email has one domain ",(){
          var result = Validator.validateEmail(email: "test@a");
          expect(result,'Enter a correct email');
        });
        test("Email with . in the end ",(){
          var result = Validator.validateEmail(email: "test@gmai.com.");
          expect(result,'Enter a correct email');
        });
      });
      test("Valid email",(){
        var result = Validator.validateEmail(email: "te?s/t@gmail.com.t.d");
        expect(result,null);
      });
    });
    group("Name validation - ",(){
      test("Name is empty",(){
        var result = Validator.validateName(name:'');
        expect(result,'Name can\'t be empty');
      });
      test("Name is valid",(){
        var result = Validator.validateName(name:'Name');
        expect(result,null);
      });
    });
    group("Password validation",(){
      test("Password is empty ",(){
        var result = Validator.validatePassword(password:'');
        expect(result,'Password can\'t be empty');
      });
      test("Password is less then 6 ",(){
        var result = Validator.validatePassword(password:'pass1');
        expect(result,'Enter a password with length at least 6');
      });
      test("Password is valid ",(){
        var result = Validator.validatePassword(password:'pass123');
        expect(result,null);
      });
    });
  });
}