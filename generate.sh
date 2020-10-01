MODULE_SRC=HomeWork2/Network
openapi-generator generate -i openApi.yaml -g swift5 -o api-mobile
openapi-generator generate -i jobOpenApi.yaml -g swift5 -o api-mobile
rm -r $MODULE_SRC""*
cp -R api-mobile/OpenAPIClient/Classes/OpenAPIs/. $MODULE_SRC
rm -r api-mobile
HomeWork2/Network
