{ lib
, buildPythonPackage
, fetchPypi
, poetry-core
, pythonOlder
, types-awscrt
, typing-extensions
}:

buildPythonPackage rec {
  pname = "botocore-stubs";
  version = "1.34.45";
  format = "pyproject";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    pname = "botocore_stubs";
    inherit version;
    hash = "sha256-hw7MQfRVnatZKw49XVKVDiw1IRz7vt9bBcucp2D7KRs=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    types-awscrt
    typing-extensions
  ];

  pythonImportsCheck = [
    "botocore-stubs"
  ];

  meta = with lib; {
    description = "Type annotations and code completion for botocore";
    homepage = "https://pypi.org/project/botocore-stubs/";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
