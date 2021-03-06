set -e
pushd "$PWD"/CFC_WebApp
# find . -name \*.pyc | xargs rm
cp config.json.localhost.android config.json
cp keys.json.sample keys.json
python -m unittest discover -s tests -p Test*;
popd
pushd "$PWD"/CFC_DataCollector
# find . -name \*.pyc | xargs rm
cp ../CFC_WebApp/config.json config.json
cp ../CFC_WebApp/keys.json.sample keys.json
PYTHONPATH=. python -m unittest discover -s tests -p Test*
popd
