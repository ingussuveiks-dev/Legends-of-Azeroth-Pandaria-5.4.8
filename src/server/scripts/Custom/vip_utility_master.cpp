#include "ScriptPCH.h"
#include "ScriptedGossip.h"

enum VipUtilityMaster
{
    NPC_VIP_UTILITY_MASTER = 900100,
    ACTION_VENDOR = GOSSIP_ACTION_INFO_DEF + 1,
    ACTION_TRAINER = GOSSIP_ACTION_INFO_DEF + 2
};

struct npc_vip_utility_master : public ScriptedAI
{
    npc_vip_utility_master(Creature* creature) : ScriptedAI(creature) { }

    bool OnGossipHello(Player* player) override
    {
        ClearGossipMenuFor(player);
        AddGossipItemFor(player, GOSSIP_ICON_VENDOR, "Browse free mount goods.", GOSSIP_SENDER_MAIN, ACTION_VENDOR);
        AddGossipItemFor(player, GOSSIP_ICON_TRAINER, "Train riding, weapons and professions.", GOSSIP_SENDER_MAIN, ACTION_TRAINER);
        SendGossipMenuFor(player, DEFAULT_GOSSIP_MESSAGE, me->GetGUID());
        return true;
    }

    bool OnGossipSelect(Player* player, uint32 /*menuId*/, uint32 gossipListId) override
    {
        uint32 const action = player->PlayerTalkClass->GetGossipOptionAction(gossipListId);
        ClearGossipMenuFor(player);

        switch (action)
        {
            case ACTION_VENDOR:
                player->GetSession()->SendListInventory(me->GetGUID());
                break;
            case ACTION_TRAINER:
                player->GetSession()->SendTrainerList(me->GetGUID());
                break;
            default:
                CloseGossipMenuFor(player);
                break;
        }

        return true;
    }
};

void AddSC_vip_utility_master()
{
    RegisterCreatureAI(npc_vip_utility_master);
}
