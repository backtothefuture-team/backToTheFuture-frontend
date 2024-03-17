
String? myValidate(String? value, String field, {int? minLength, bool confirmPassword = false, String? userPassword}) {
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