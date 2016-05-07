#!/bin/bash

stringZ=abcABC123ABCabc

echo ${stringZ/abc/xyz}
echo ${stringZ//abc/xyz}

echo ${stringZ/#abc/XYZ}
echo ${stringZ/%abc/XYZ}

exit 0
