rem !!! Do not forget to change the version in setup.py !!!
bash -c "make release"
pip install ./dist/kifield-0.1.23.tar.gz
kifield -v
pause