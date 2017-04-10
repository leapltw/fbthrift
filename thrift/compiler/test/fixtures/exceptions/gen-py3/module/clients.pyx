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
from libcpp.vector cimport vector as vector
from libcpp.set cimport set as cset
from libcpp.map cimport map as cmap
from cython.operator cimport dereference as deref, typeid
from cpython.ref cimport PyObject
from thrift.py3.client cimport py3_get_exception, cRequestChannel_ptr, makeClientWrapper
from folly cimport cFollyTry, cFollyUnit, c_unit
from libcpp.typeinfo cimport type_info
import thrift.py3.types
cimport thrift.py3.types
import thrift.py3.client
cimport thrift.py3.client
from folly.futures cimport bridgeFutureWith
from folly.executor cimport get_executor

import asyncio
import sys
import traceback

cimport module.types
import module.types

from module.clients_wrapper cimport cRaiserAsyncClient, cRaiserClientWrapper


cdef void Raiser_doBland_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* future
):
    cdef object pyfuture = <object> future
    cdef cFollyUnit citem
    if result.hasException():
        try:
            result.exception().throwException()
        except Exception as ex:
            pyfuture.set_exception(ex)
    else:
        citem = c_unit;
        pyfuture.set_result(None)

cdef void Raiser_doRaise_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* future
):
    cdef object pyfuture = <object> future
    cdef cFollyUnit citem
    cdef unique_ptr[module.types.cBanal] ex_b
    cdef unique_ptr[module.types.cFiery] ex_f
    if result.hasException[module.types.cBanal]():
        ex_b = py3_get_exception[module.types.cBanal](result.exception())
        pyfuture.set_exception(module.types.Banal.create(module.types.move(ex_b)))
    elif result.hasException[module.types.cFiery]():
        ex_f = py3_get_exception[module.types.cFiery](result.exception())
        pyfuture.set_exception(module.types.Fiery.create(module.types.move(ex_f)))
    elif result.hasException():
        try:
            result.exception().throwException()
        except Exception as ex:
            pyfuture.set_exception(ex)
    else:
        citem = c_unit;
        pyfuture.set_result(None)

cdef void Raiser_get200_callback(
    cFollyTry[string]&& result,
    PyObject* future
):
    cdef object pyfuture = <object> future
    cdef unique_ptr[string] citem
    if result.hasException():
        try:
            result.exception().throwException()
        except Exception as ex:
            pyfuture.set_exception(ex)
    else:
        citem = make_unique[string](result.value());
        pyfuture.set_result((deref(citem.get())).decode('UTF-8'))

cdef void Raiser_get500_callback(
    cFollyTry[string]&& result,
    PyObject* future
):
    cdef object pyfuture = <object> future
    cdef unique_ptr[string] citem
    cdef unique_ptr[module.types.cFiery] ex_f
    cdef unique_ptr[module.types.cBanal] ex_b
    if result.hasException[module.types.cFiery]():
        ex_f = py3_get_exception[module.types.cFiery](result.exception())
        pyfuture.set_exception(module.types.Fiery.create(module.types.move(ex_f)))
    elif result.hasException[module.types.cBanal]():
        ex_b = py3_get_exception[module.types.cBanal](result.exception())
        pyfuture.set_exception(module.types.Banal.create(module.types.move(ex_b)))
    elif result.hasException():
        try:
            result.exception().throwException()
        except Exception as ex:
            pyfuture.set_exception(ex)
    else:
        citem = make_unique[string](result.value());
        pyfuture.set_result((deref(citem.get())).decode('UTF-8'))


cdef class Raiser(thrift.py3.client.Client):

    def __cinit__(Raiser self):
        loop = asyncio.get_event_loop()
        self._connect_future = loop.create_future()
        self._executor = get_executor()

    cdef const type_info* _typeid(Raiser self):
        return &typeid(cRaiserAsyncClient)

    @staticmethod
    cdef _module_Raiser_set_client(Raiser inst, shared_ptr[cRaiserClientWrapper] c_obj):
        """So the class hierarchy talks to the correct pointer type"""
        inst._module_Raiser_client = c_obj

    def __dealloc__(Raiser self):
        if self._cRequestChannel or self._module_Raiser_client:
            print('client was not cleaned up, use the context manager', file=sys.stderr)

    async def __aenter__(Raiser self):
        await self._connect_future
        if self._cRequestChannel:
            Raiser._module_Raiser_set_client(
                self,
                makeClientWrapper[cRaiserAsyncClient, cRaiserClientWrapper](
                    self._cRequestChannel
                ),
            )
            self._cRequestChannel.reset()
        else:
            raise asyncio.InvalidStateError('Client context has been used already')
        return self

    async def __aexit__(Raiser self, *exc):
        self._check_connect_future()
        loop = asyncio.get_event_loop()
        future = loop.create_future()
        bridgeFutureWith[cFollyUnit](
            self._executor,
            deref(self._module_Raiser_client).disconnect(),
            closed_Raiser_py3_client_callback,
            <PyObject *>future
        )
        # To break any future usage of this client
        badfuture = loop.create_future()
        badfuture.set_exception(asyncio.InvalidStateError('Client Out of Context'))
        badfuture.exception()
        self._connect_future = badfuture
        await future
        self._module_Raiser_client.reset()

    async def doBland(
            Raiser self):
        self._check_connect_future()
        loop = asyncio.get_event_loop()
        future = loop.create_future()
        bridgeFutureWith[cFollyUnit](
            self._executor,
            deref(self._module_Raiser_client).doBland(
            ),
            Raiser_doBland_callback,
            <PyObject *> future
        )
        return await future

    async def doRaise(
            Raiser self):
        self._check_connect_future()
        loop = asyncio.get_event_loop()
        future = loop.create_future()
        bridgeFutureWith[cFollyUnit](
            self._executor,
            deref(self._module_Raiser_client).doRaise(
            ),
            Raiser_doRaise_callback,
            <PyObject *> future
        )
        return await future

    async def get200(
            Raiser self):
        self._check_connect_future()
        loop = asyncio.get_event_loop()
        future = loop.create_future()
        bridgeFutureWith[string](
            self._executor,
            deref(self._module_Raiser_client).get200(
            ),
            Raiser_get200_callback,
            <PyObject *> future
        )
        return await future

    async def get500(
            Raiser self):
        self._check_connect_future()
        loop = asyncio.get_event_loop()
        future = loop.create_future()
        bridgeFutureWith[string](
            self._executor,
            deref(self._module_Raiser_client).get500(
            ),
            Raiser_get500_callback,
            <PyObject *> future
        )
        return await future



cdef void closed_Raiser_py3_client_callback(
    cFollyTry[cFollyUnit]&& result,
    PyObject* fut,
):
    cdef object pyfuture = <object> fut
    pyfuture.set_result(None)

