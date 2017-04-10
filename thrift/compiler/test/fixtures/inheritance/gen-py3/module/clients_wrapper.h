/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

#pragma once
#include <src/gen-cpp2/MyRoot.h>
#include <src/gen-cpp2/MyNode.h>
#include <src/gen-cpp2/MyLeaf.h>

#include <folly/futures/Future.h>
#include <folly/futures/Promise.h>
#include <folly/Unit.h>

#include <cstdint>
#include <functional>
#include <map>
#include <memory>
#include <set>
#include <vector>

namespace cpp2 {

class MyRootClientWrapper {
  protected:
    std::shared_ptr<cpp2::MyRootAsyncClient> async_client;
  public:
    explicit MyRootClientWrapper(
      std::shared_ptr<cpp2::MyRootAsyncClient> async_client);
    virtual ~MyRootClientWrapper();

    folly::Future<folly::Unit> disconnect();
    void disconnectInLoop();

    folly::Future<folly::Unit> do_root();
};


class MyNodeClientWrapper : virtual public cpp2::MyRootClientWrapper,  {
  protected:
    std::shared_ptr<cpp2::MyNodeAsyncClient> async_client;
  public:
    explicit MyNodeClientWrapper(
      std::shared_ptr<cpp2::MyNodeAsyncClient> async_client);

    folly::Future<folly::Unit> disconnect();
    void disconnectInLoop();

    folly::Future<folly::Unit> do_mid();
};


class MyLeafClientWrapper : virtual public cpp2::MyNodeClientWrapper {
  protected:
    std::shared_ptr<cpp2::MyLeafAsyncClient> async_client;
  public:
    explicit MyLeafClientWrapper(
      std::shared_ptr<cpp2::MyLeafAsyncClient> async_client);

    folly::Future<folly::Unit> disconnect();
    void disconnectInLoop();

    folly::Future<folly::Unit> do_leaf();
};


} // namespace cpp2
