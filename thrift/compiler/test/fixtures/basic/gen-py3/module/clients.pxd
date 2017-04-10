#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#
from libcpp.memory cimport shared_ptr
cimport thrift.py3.client


from module.clients_wrapper cimport cMyServiceClientWrapper
from module.clients_wrapper cimport cMyServiceFastClientWrapper
from module.clients_wrapper cimport cMyServiceEmptyClientWrapper
from module.clients_wrapper cimport cMyServicePrioParentClientWrapper
from module.clients_wrapper cimport cMyServicePrioChildClientWrapper

cdef class MyService(thrift.py3.client.Client):
    cdef shared_ptr[cMyServiceClientWrapper] _module_MyService_client

    @staticmethod
    cdef _module_MyService_set_client(MyService inst, shared_ptr[cMyServiceClientWrapper] c_obj)

cdef class MyServiceFast(thrift.py3.client.Client):
    cdef shared_ptr[cMyServiceFastClientWrapper] _module_MyServiceFast_client

    @staticmethod
    cdef _module_MyServiceFast_set_client(MyServiceFast inst, shared_ptr[cMyServiceFastClientWrapper] c_obj)

cdef class MyServiceEmpty(thrift.py3.client.Client):
    cdef shared_ptr[cMyServiceEmptyClientWrapper] _module_MyServiceEmpty_client

    @staticmethod
    cdef _module_MyServiceEmpty_set_client(MyServiceEmpty inst, shared_ptr[cMyServiceEmptyClientWrapper] c_obj)

cdef class MyServicePrioParent(thrift.py3.client.Client):
    cdef shared_ptr[cMyServicePrioParentClientWrapper] _module_MyServicePrioParent_client

    @staticmethod
    cdef _module_MyServicePrioParent_set_client(MyServicePrioParent inst, shared_ptr[cMyServicePrioParentClientWrapper] c_obj)

cdef class MyServicePrioChild(MyServicePrioParent):
    cdef shared_ptr[cMyServicePrioChildClientWrapper] _module_MyServicePrioChild_client

    @staticmethod
    cdef _module_MyServicePrioChild_set_client(MyServicePrioChild inst, shared_ptr[cMyServicePrioChildClientWrapper] c_obj)

