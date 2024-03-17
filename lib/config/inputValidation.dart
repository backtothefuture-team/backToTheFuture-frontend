
String? inputValidation(String? value, String field, {int? minLength, bool confirmPassword = false, String? userPassword}) {
  if( value == null || value.isEmpty ) {
    return '$field을(를) 입력해 주세요.';
  }

  if( minLength != null && value.length < minLength ) {
    return '$field는 $minLength자리 이상 입력해 주세요.';
  }

  if( confirmPassword && value != userPassword ) {
    return '비밀번호가 일치하지 않습니다.';
  }

  return null;
}

String? validateEmail(String? value) =>
    value == '' ? '이메일을 입력해 주세요.' : null;

String? validateNickName(String? value) =>
    value == '' ? '닉네임을 입력해 주세요.' : null;

String? validatePassword(String? value) =>
    value == null || value.length < 6 ? '비밀번호를 입력해 주세요.' : null;

String? validateConfirmPassword(String? value, String password) =>
    value != password ? '비밀번호가 일치하지 않습니다.' : null;
