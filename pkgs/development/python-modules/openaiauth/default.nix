{
  lib,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  setuptools,
  tls-client,
}:

buildPythonPackage rec {
  pname = "openaiauth";
  version = "3.0.0";
  pyproject = true;

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit version;
    pname = "OpenAIAuth";
    hash = "sha256-9SrptiheiM5s9YI6Ht68ahDGMFADWfBQgAWUBY3EEJ8=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [ tls-client ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [ "OpenAIAuth" ];

  meta = with lib; {
    description = "Library for authenticating with the OpenAI API";
    homepage = "https://github.com/acheong08/OpenAIAuth";
    changelog = "https://github.com/acheong08/OpenAIAuth/releases/tag/${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ realsnick ];
  };
}
