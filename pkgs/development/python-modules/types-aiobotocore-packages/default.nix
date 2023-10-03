{ lib
, buildPythonPackage
, pythonOlder
, aiobotocore
, botocore
, typing-extensions
, fetchPypi
}:
let
  toUnderscore = str: builtins.replaceStrings [ "-" ] [ "_" ] str;

  buildTypesAiobotocorePackage = serviceName: version: hash:
    buildPythonPackage rec {
      pname = "types-aiobotocore-${serviceName}";
      inherit version;
      format = "setuptools";

      disabled = pythonOlder "3.7";

      src = fetchPypi {
        inherit pname version hash;
      };

      propagatedBuildInputs = [
        aiobotocore
        botocore
      ] ++ lib.optionals (pythonOlder "3.12") [
        typing-extensions
      ];

      # Project has no tests
      doCheck = false;

      pythonImportsCheck = [
        "types_aiobotocore_${toUnderscore serviceName}"
      ];

      meta = with lib; {
        description = "Type annotations for aiobotocore ${serviceName}";
        homepage = "https://github.com/youtype/mypy_boto3_builder";
        license = with licenses; [ mit ];
        maintainers = with maintainers; [ mbalatsko ];
      };
    };
in
rec {
  types-aiobotocore-accessanalyzer = buildTypesAiobotocorePackage "accessanalyzer" "2.6.0" "sha256-Bit55lGYI8+VOEm+6NKlfxWldFWdiAFwRZjJsgwuv7Q=";

  types-aiobotocore-account = buildTypesAiobotocorePackage "account" "2.5.2.post3" "sha256-zuBKsuPD3Sjl8KWKIlMgKtzfmtVc8ZZyIMKyPC2QjmY=";

  types-aiobotocore-acm = buildTypesAiobotocorePackage "acm" "2.5.4" "sha256-B7SsW+FtSOMfFFdfmH9iv/i9R/qj6ImAr95gpPAf3G4=";

  types-aiobotocore-acm-pca = buildTypesAiobotocorePackage "acm-pca" "2.6.0" "sha256-AO3CEqWkLBTkx4k8YamcUUCg2TwHODCMjz6ujubzLjA=";

  types-aiobotocore-alexaforbusiness = buildTypesAiobotocorePackage "alexaforbusiness" "2.6.0" "sha256-Pjfm+q8Wq7BT3QfFcLuODteOZdvNXSegde1sc6z2UOk=";

  types-aiobotocore-amp = buildTypesAiobotocorePackage "amp" "2.6.0" "sha256-EZ/wSfcWnT7DoSRegMZnzukVLlTFYP2UsR+rEiLwtnE=";

  types-aiobotocore-amplify = buildTypesAiobotocorePackage "amplify" "2.6.0" "sha256-IkvRE9xD0y8l48rWuV1cvnOQ7eHr0hYsrD3NusofgyI=";

  types-aiobotocore-amplifybackend = buildTypesAiobotocorePackage "amplifybackend" "2.6.0" "sha256-4sSNDhmNuOnYPq0X/G8m0XDP08W+MUQ3xiWK9Yc8U6Q=";

  types-aiobotocore-amplifyuibuilder = buildTypesAiobotocorePackage "amplifyuibuilder" "2.6.0" "sha256-K1esoNUDYWzqK12X6o5c12XJQGGDNlCyUiVsNsUaQhI=";

  types-aiobotocore-apigateway = buildTypesAiobotocorePackage "apigateway" "2.6.0" "sha256-r4eDPDqkcQhApN/+4xjDuillQnDOqu2xqyACYHqXRpw=";

  types-aiobotocore-apigatewaymanagementapi = buildTypesAiobotocorePackage "apigatewaymanagementapi" "2.6.0" "sha256-sAJW4q/mUaRsiN7Yt/uBMbxDfKhTSdiZaDd7nvvM3og=";

  types-aiobotocore-apigatewayv2 = buildTypesAiobotocorePackage "apigatewayv2" "2.6.0" "sha256-cNNVvAX1o+ZieUaW59yp5ELFf2S96XdCOLeVe91oFI8=";

  types-aiobotocore-appconfig = buildTypesAiobotocorePackage "appconfig" "2.6.0" "sha256-qliKZTlmnPwRdhQs26M0PlCM91Mn7cHCmccCAhDtryU=";

  types-aiobotocore-appconfigdata = buildTypesAiobotocorePackage "appconfigdata" "2.6.0" "sha256-DcLOpKbUl/YOinXXtlo2su0uMh0Ja5cGrpbmKuQVGvw=";

  types-aiobotocore-appfabric = buildTypesAiobotocorePackage "appfabric" "2.6.0" "sha256-yQvNa3iBsoAD4oBVmt0ZNjziBEhzTUE6E6FFLluxTZw=";

  types-aiobotocore-appflow = buildTypesAiobotocorePackage "appflow" "2.6.0" "sha256-ILdWiqipfSnSjdToIq++JIu1WUmv+lMX72Ymo9KGZ9s=";

  types-aiobotocore-appintegrations = buildTypesAiobotocorePackage "appintegrations" "2.6.0" "sha256-ZPNB2PUpeTttagX1rRmgINgahj3cNuBdKQMvdFNK15Y=";

  types-aiobotocore-application-autoscaling = buildTypesAiobotocorePackage "application-autoscaling" "2.6.0" "sha256-p5EgvysfhIHz4ZALV8tJz/7ZkRIu2BIZwENiiVho67w=";

  types-aiobotocore-application-insights = buildTypesAiobotocorePackage "application-insights" "2.6.0" "sha256-PUDqMFJu2BG3WVCS6SYyltrSr64VblVAgrCYQ6FR2sk=";

  types-aiobotocore-applicationcostprofiler = buildTypesAiobotocorePackage "applicationcostprofiler" "2.6.0" "sha256-bGlbP0d38vFHkITC84N43Vt1Nrsf3+ByWSvvteDejBw=";

  types-aiobotocore-appmesh = buildTypesAiobotocorePackage "appmesh" "2.6.0" "sha256-Lcoc/IJ9o1glV8gNNA/t9B3J6K5Qz/50fqPMsF78WVI=";

  types-aiobotocore-apprunner = buildTypesAiobotocorePackage "apprunner" "2.6.0" "sha256-zyesnbNmSrQEsBVQJouP05zxhBTikGZVCR/VFdEkHNE=";

  types-aiobotocore-appstream = buildTypesAiobotocorePackage "appstream" "2.6.0" "sha256-+4LWBHHwL1R4jBGHChSUOq9vFc+k7NmRXvo8ZjDIyXk=";

  types-aiobotocore-appsync = buildTypesAiobotocorePackage "appsync" "2.6.0" "sha256-JFrBy9Ck/Ni4lwHV47fkzt/YI5cX9FvTeaT0tNgzdqs=";

  types-aiobotocore-arc-zonal-shift = buildTypesAiobotocorePackage "arc-zonal-shift" "2.6.0" "sha256-qTW58yyFwbBYyisuL4NkaEXqblJ3vevXI1lHZVX4mZY=";

  types-aiobotocore-athena = buildTypesAiobotocorePackage "athena" "2.6.0" "sha256-xmTKI8q82UohBE+Wh+j1xivsY8wmrcvOlDAlwTpJmxE=";

  types-aiobotocore-auditmanager = buildTypesAiobotocorePackage "auditmanager" "2.6.0" "sha256-a+47CFM19RM3Y+9wLLe8D4II7rKeDQ93dy68jqJqBD4=";

  types-aiobotocore-autoscaling = buildTypesAiobotocorePackage "autoscaling" "2.6.0" "sha256-s0ClcRgYJcd5GZXYWMn2FieNXebdlS9206mLtKCSy44=";

  types-aiobotocore-autoscaling-plans = buildTypesAiobotocorePackage "autoscaling-plans" "2.6.0" "sha256-ZhOokFIm5KHBc5X+Lp19z5N7BudTQHU5KjHGYCrW/aE=";

  types-aiobotocore-xray = buildTypesAiobotocorePackage "xray" "2.6.0" "sha256-DPirH1s636ZW6VKyD4wMiJEfM+u9NknH0ODLQagaLrs=";
}
