#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Function.hpp"
#include "IRBuilder.hpp"
#include "Module.hpp"
#include "Type.hpp"

#include <iostream>
#include <memory>

// 定义一个从常数值获取/创建 ConstantInt 类实例化的宏，方便多次调用
#define CONST_INT(num) \
    ConstantInt::get(num, module)

int main()
{
    auto module = new Module();
    // 创建一个 IRBuilder 实例（后续创建指令均使用此实例操作）
    auto builder = new IRBuilder(nullptr, module);
    Type *Int32Type = module->get_int32_type();
    auto mainFun = Function::create(FunctionType::get(Int32Type, {}), "main", module);
    auto bb = BasicBlock::create(module, "entry", mainFun);
    // 使用辅助类实例化 builder 创建了一条 alloca 指令，在栈上分配返回值的空间

    // 将 builder 插入指令的位置调整至 main 函数起始 bb 上
    builder->set_insert_point(bb);
    // 用 builder 创建 alloca 指令，为函数返回值分配空间
    auto retAlloca = builder->create_alloca(Int32Type);
    // main 函数默认 ret 0
    builder->create_store(CONST_INT(0), retAlloca);

    // 用 builder 创建 alloca 指令，用于 i 的存放
    auto iAlloca = builder->create_alloca(Int32Type);
    builder->create_store(CONST_INT(0), iAlloca);
    // 用 builder 创建 alloca 指令，用于 a 的存放
    auto aAlloca = builder->create_alloca(Int32Type);
    // 用 builder 创建 store 指令，将 10 的数据写入 a
    builder->create_store(CONST_INT(10), aAlloca);

    /*    while (i < 10) {
            i = i + 1;
            a = a + i;
        }
        */
    // 创建基本块用于 while 循环体
    auto whileBodyBB = BasicBlock::create(module, "whilebody", mainFun);
    // 创建 br 指令，跳转到 while 循环体
    builder->create_br(whileBodyBB);
    // 为 while的if else 分支创建两个 BasicBlock
    auto trueBB = BasicBlock::create(module, "trueBB", mainFun);
    auto falseBB = BasicBlock::create(module, "falseBB", mainFun);
    // 将辅助类实例化 builder
    builder->set_insert_point(whileBodyBB);
    // 用 builder 创建 load 指令，将 iAlloca 中的值加载到 iLoad 变量中
    auto iLoad = builder->create_load(iAlloca);

    // 创建比较指令 i < 10
    auto cmp = builder->create_icmp_lt(iLoad, CONST_INT(10));

    auto br = builder->create_cond_br(cmp, trueBB, falseBB);
    // 将 builder 插入指令的位置调整至 trueBB 上
    builder->set_insert_point(trueBB);
    // 创建 i = i + 1
    iLoad = builder->create_load(iAlloca);
    auto iAdd = builder->create_iadd(iLoad, CONST_INT(1));
    // 创建 store 指令，将 iAdd 的值存入 iAlloca
    builder->create_store(iAdd, iAlloca);
    // load i
    iLoad = builder->create_load(iAlloca);
    // load a
    auto aLoad = builder->create_load(aAlloca);
    // 创建 a = a + i
    auto aAdd = builder->create_iadd(aLoad, iAdd);
    // 创建 store 指令，将 aAdd 的值存入 aAlloca
    builder->create_store(aAdd, aAlloca);
    // 创建 br 指令，跳转到 while 循环体
    builder->create_br(whileBodyBB);

    // 将辅助类实例化 builder 插入指令的位置调整至 falseBB 上
    builder->set_insert_point(falseBB);
    aLoad = builder->create_load(aAlloca);
    builder->create_ret(aLoad); // Return a

    // 输出 module 中的所有 IR 指令
    std::cout << module->print();
    delete module;
    return 0;
}
