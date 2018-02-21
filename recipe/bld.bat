:: Make sure iris can find the udunits2 library while it's in the temporary
:: build environment. This is necessary because the build process also compiles
:: the pyke rules, which requires importing iris.

set SITECFG=lib/iris/etc/site.cfg
echo [System] > %SITECFG%
echo udunits2_path = %SCRIPTS%\udunits2.dll >> %SITECFG%

rmdir lib\iris\tests\results /s /q
del lib\iris\tests\*.npz

%PYTHON% -m pip install --no-deps --ignore-installed .
