#include "Dominators.hpp"

void Dominators::run()
{
    for (auto &f1 : m_->get_functions())
    {
        auto f = &f1;
        if (f->get_basic_blocks().size() == 0)
            continue;
        for (auto &bb1 : f->get_basic_blocks())
        {
            auto bb = &bb1;
            idom_.insert({bb, {}});
            dom_frontier_.insert({bb, {}});
            dom_tree_succ_blocks_.insert({bb, {}});
        }

        create_reverse_post_order(f);
        create_idom(f);
        create_dominance_frontier(f);
        create_dom_tree_succ(f);
    }
}

void Dominators::create_reverse_post_order(Function *f)
{
    reverse_postorder_.clear();
    post_order_.clear();
    std::set<BasicBlock *> visited;
    post_order_visit(f->get_entry_block(), visited);
    reverse_postorder_.reverse();
}

void Dominators::post_order_visit(BasicBlock *bb, std::set<BasicBlock *> &visited)
{
    visited.insert(bb);
    for (auto b : bb->get_succ_basic_blocks())
    {
        if (visited.find(b) == visited.end())
            post_order_visit(b, visited);
    }
    post_order_[bb] = reverse_postorder_.size();
    reverse_postorder_.push_back(bb);
}

void Dominators::create_idom(Function *f)
{

    idom_[f->get_entry_block()] = f->get_entry_block();

    bool changed = true;
    while (changed)
    {
        changed = false;
        for (auto bb : this->reverse_postorder_)
        {
            if (bb == f->get_entry_block())
            {
                continue;
            }

            BasicBlock *new_idom ;
            for (auto p : bb->get_pre_basic_blocks())
            {
                if (idom_[p])
                {
                    new_idom = p;
                    break;
                }
            }
            for (auto p : bb->get_pre_basic_blocks())
            {
                if (p == new_idom)
                    continue;
                if (idom_[p])
                {
                    auto finger1 = p;
                    auto finger2 = new_idom;
                    while (finger1 != finger2)
                    {
                        while (post_order_[finger1] < post_order_[finger2])
                        {
                            finger1 = idom_[finger1];
                        }
                        while (post_order_[finger2] < post_order_[finger1])
                        {
                            finger2 = idom_[finger2];
                        }
                    }
                    new_idom = finger1;
                }
            }
            if (idom_[bb] != new_idom)
            {
                idom_[bb] = new_idom;
                changed = true;
            }
        }
    }
}

void Dominators::create_dominance_frontier(Function *f)
{
    for (auto &bb1 : f->get_basic_blocks())
    {
        auto bb = &bb1;
        if (bb->get_pre_basic_blocks().size() >= 2)
        {
            for (auto p : bb->get_pre_basic_blocks())
            {
                auto runner = p;
                while (runner != idom_[bb])
                {
                    dom_frontier_[runner].insert(bb);
                    runner = idom_[runner];
                }
            }
        }
    }
}

void Dominators::create_dom_tree_succ(Function *f)
{
    for (auto &bb1 : f->get_basic_blocks())
    {
        auto bb = &bb1;
        if (idom_[bb] != bb)
        {
            dom_tree_succ_blocks_[idom_[bb]].insert(bb);
        }
    }
}
