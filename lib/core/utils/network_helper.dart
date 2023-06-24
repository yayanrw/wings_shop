Map<String, String> defaultHeader() {
  return {
    'Accept': 'application/json',
  };
}

Map<String, String> headerWithToken() {
  return {
    'Authorization': 'Bearer ',
    'Accept': 'application/json',
  };
}