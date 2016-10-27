PYTHON_EXECUTABLE=/opt/python/${PYVERSION}/bin/python

${PYTHON_EXECUTABLE} -m pip install ecell-${VERSION}-${PYVERSION}-manylinux1_x86_64.whl
${PYTHON_EXECUTABLE} -c "import ecell4"
