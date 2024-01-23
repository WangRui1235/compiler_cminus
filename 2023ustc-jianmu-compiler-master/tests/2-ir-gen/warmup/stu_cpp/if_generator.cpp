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
#define CONST_FP(num) \
    ConstantFP::get(num, module)
int main()
{
    auto module = new Module();
    // 创建一个 IRBuilder 实例（后续创建指令均使用此实例操作）
    auto builder = new IRBuilder(nullptr, module);
    Type *Int32Type = module->get_int32_type();
    Type *FloatType = module->get_float_type();
    auto mainFun = Function::create(FunctionType::get(Int32Type, {}), "main", module);
    auto bb = BasicBlock::create(module, "entry", mainFun);

    // 将 builder 插入指令的位置调整至 main 函数起始 bb 上
    builder->set_insert_point(bb);
    // 用 builder 创建 alloca 指令，为函数返回值分配空间
    auto retAlloca = builder->create_alloca(Int32Type);
    // main 函数默认 ret 0
    builder->create_store(CONST_INT(0), retAlloca);

    // Set the return value to [a[1]
    auto a = builder->create_alloca(FloatType);
    builder->create_store(CONST_FP(5.555), a); // a[0] = 10
    auto aLoad = builder->create_load(a);
    // 用 builder 创建 icmp lt 指令，指令操作数为 a，b load 出来的值
    auto fcmp = builder->create_fcmp_gt(aLoad, CONST_FP(1));
    // 为 if else 分支创建两个 BasicBlock
    auto trueBB = BasicBlock::create(module, "trueBB", mainFun);
    auto falseBB = BasicBlock::create(module, "falseBB", mainFun);
    // 为函数 gcd 创建 BasicBlock 作为 return 分支，提前创建，以便在 true 分支中可以创建跳转到 return 分支的 br 指令
    auto retBB = BasicBlock::create(module, "", mainFun); // return 分支，
                                                          // 为 entrybb 创建终结指令，条件跳转指令，使用 icmp 指令的返回值作为条件，trueBB 与 falseBB 作为条件跳转的两个目的 basicblock
    auto br = builder->create_cond_br(fcmp, trueBB, falseBB);
    // 将 builder 插入指令的位置调整至 trueBB 上
    builder->set_insert_point(trueBB);


    // 使用辅助类实例化 builder 创建了一条 store 指令，将参数 u store 至为返回值分配的空间
    builder->create_store(CONST_INT(233), retAlloca);
    // 使用 builder 创建一条强制跳转指令，跳转到 retBB 处
    builder->create_br(retBB); // br retBB


    // 将辅助类实例化 builder 插入指令的位置调整至 falseBB 上
    builder->set_insert_point(falseBB);
   
    builder->create_store(CONST_INT(0), retAlloca);
    // 使用 builder 创建一条强制跳转指令，跳转到 retBB 处
    builder->create_br(retBB); // br retBB
   // 将 builder 插入指令的位置调整至 retBB 上
    builder->set_insert_point(retBB); // ret 分支
    // 使用 builder 创建了一条 load 指令，将 gcd 函数返回值 load 出来
    auto retLoad = builder->create_load(retAlloca);
    // 使用 builder 创建了一条 ret 指令，将 gcd 返回值 load 出来的结果作为 gcd 函数的返回值返回
    builder->create_ret(retLoad);
    // 输出 module 中的所有 IR 指令
    std::cout << module->print();
    delete module;
    return 0;
}