String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }

  final emailRegex = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  if (!emailRegex.hasMatch(value)) {
    return 'Enter a valid email';
  }

  return null;
}

String? validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return 'Username is required';
  }

  if (value.length < 3) {
    return 'Username must be at least 3 characters';
  }

  final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');

  if (!usernameRegex.hasMatch(value)) {
    return 'Only letters, numbers, and _ allowed';
  }

  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  if (value.length < 8) {
    return 'Password must be at least 8 characters';
  }

  if (value.length > 64) {
    return 'Password must be less than 64 characters';
  }

  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Include at least one uppercase letter';
  }

  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Include at least one lowercase letter';
  }

  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Include at least one number';
  }

  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    return 'Include at least one special character';
  }

  return null;
}

String? validateDisplayName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Display name is required';
  }

  final name = value.trim();

  if (name.length < 2) {
    return 'Display name must be at least 2 characters';
  }

  if (name.length > 30) {
    return 'Display name must be less than 30 characters';
  }

  final nameRegex = RegExp(r"^[a-zA-Z]+(?:[ '-][a-zA-Z]+)*$");

  if (!nameRegex.hasMatch(name)) {
    return 'Only letters and spaces are allowed';
  }

  return null;
}
