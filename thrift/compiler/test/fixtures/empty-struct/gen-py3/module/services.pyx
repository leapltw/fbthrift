#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t
from libcpp.vector cimport vector
from libcpp.set cimport set as cset
from libcpp.map cimport map as cmap
from cython.operator cimport dereference as deref
from cpython.ref cimport PyObject
from thrift.py3.exceptions cimport cTApplicationException
from thrift.py3.server cimport ServiceInterface
from folly cimport (
  cFollyPromise,
  cFollyUnit,
  c_unit
)
cimport module.types
import module.types

import asyncio
import functools
import sys
import traceback



cdef extern from "<utility>" namespace "std":
    cdef cFollyPromise[unique_ptr[string]] move(cFollyPromise[unique_ptr[string]])
    pass


