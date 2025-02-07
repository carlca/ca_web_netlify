from collections.dict import Dict

@value
struct PostResponse():
  var _raw_data: String

  fn __init__(out self):
    self._raw_data = String()

  fn __init__(out self, raw_data: String):
    self._raw_data = raw_data

  fn build_dict(self) raises -> Dict[String, String]:
    var dict = Dict[String, String]()
    var raw_data = self._raw_data
    if raw_data == "":
      return dict
    if "&" not in raw_data:
      return dict
    if raw_data.startswith("\r\n"):
      raw_data = self._raw_data[2:]
    var lines = raw_data.split("&")
    for line in lines:
      if "=" not in line[]:
        continue
      var parts = line[].split("=")
      if len(parts) == 2:
        dict[parts[0]] = parts[1]
    return dict

  fn get(self, key: String) raises -> String:
    try:
      var dict = self.build_dict()
      if key in dict:
        return dict[key]
      return ""
    except:
      return ""

  fn dict(self) raises -> Dict[String, String]:
    return self.build_dict()
