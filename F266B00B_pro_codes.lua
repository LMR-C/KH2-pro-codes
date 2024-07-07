frame = 0
sora_is_mp_charging = 0
party1_is_mp_charging = 0
party2_is_mp_charging = 0
is_code_printed = false

is_hp_slip = true

is_mp_slip = true

is_zero_defense = true

is_default_status = true

is_no_form = true

is_no_summon = true

is_no_items = true
refill_items = false

is_no_cure = true
is_remove_no_cure = false
cure_count = 0

is_no_team_attack = true

is_ability_limit = true
is_ability_printed = false

is_no_rc = true

is_full_ability = true

has_to_init = true

characters_level_stat = {}
for character_id = 1, 13 do
    characters_level_stat[character_id] = {}
    for level = 1, 99 do
        characters_level_stat[character_id][level] = {}
    end
end

characters_items = {}
for character_id = 1, 13 do
    characters_items[character_id] = {}
end

characters_items_reload = {}
for character_id = 1, 13 do
    characters_items_reload[character_id] = {}
end

drive_cost = {}
for auto = 1, 2 do
    drive_cost[auto] = {}
end

summon_cost = {}

function _OnInit()
end

function address_init()
    if (GAME_ID == 0xF266B00B or GAME_ID == 0xFAF99301) and ENGINE_TYPE == "ENGINE" then --PCSX2
        ConsolePrint("PS2 version detected")
        Sys3Pointer = 0x1C61AF8
        Btl0Pointer = 0x1C61AFC
        Sys3 = ReadLong(Sys3Pointer)
	Btl0 = ReadLong(Btl0Pointer)
        Save = 0x032BB30
        battle_state_address = 0x21C61958
        pause_status_address = 0x0347E08
        is_controllable_address = 0x1D48DB8
        input = 0x2034D4DC
        cursor2 = 0x21C5F878
        sora_unit_stat = 0x1C6C750
        party1_unit_stat = 0x1C6C4E8
        party2_unit_stat = 0x1C6C280
        sora_level_stat = Btl0 + 0x25928
        donald_level_stat = Btl0 + 0x25F5C
        goofy_level_stat = Btl0 + 0x26590
        mickey_level_stat = Btl0 + 0x26BC4
        auron_level_stat = Btl0 + 0x271F8
        mulan_level_stat = Btl0 + 0x2782C
        aladdin_level_stat = Btl0 + 0x27E60
        jack_sparrow_level_stat = Btl0 + 0x28494
        beast_level_stat = 	Btl0 + 0x28AC8
        jack_skellington_level_stat = Btl0 + 0x290FC
        simba_level_stat = Btl0 + 0x29730
        tron_level_stat = Btl0 + 0x29D64
        riku_level_stat = Btl0 + 0x2A398
        sora_party_stat = Save + 0x24F0
        donald_party_stat = Save + 0x2604
        goofy_party_stat = Save + 0x2718
        mickey_party_stat = Save + 0x282C
        auron_party_stat = Save + 0x2940
        mulan_party_stat = Save + 0x2A54
        aladdin_party_stat = Save + 0x2B68
        jack_sparrow_party_stat = Save + 0x2C7C
        beast_party_stat = Save + 0x2D90
        jack_skellington_party_stat = Save + 0x2EA4
        simba_party_stat = Save + 0x2FB8
        tron_party_stat = Save + 0x30CC
        riku_party_stat = Save + 0x31E0
        valor_cost = Sys3 + 0x03E0
        wisdom_cost = Sys3 + 0x0410
        limit_cost = Sys3 + 0x7A30
        master_cost = Sys3 + 0x04A0
        final_cost = Sys3 + 0x04D0
        auto_valor_cost = Sys3 + 0x6440
        auto_wisdom_cost = Sys3 + 0x6470
        auto_limit_cost = Sys3 + 0x7A60
        auto_master_cost = Sys3 + 0x64A0
        auto_final_cost = Sys3 + 0x64D0
        chiken_little_cost = Sys3 + 0x5180
        genie_cost = Sys3 + 0x10A0
        stitch_cost = Sys3 + 0x1070
        peter_pan_cost = Sys3 + 0x37A0
        sora_cure = Save + 0x3597
        cure1_flag = Save + 0x1D31
        cure2_flag = Save + 0x1D19
        cure3_flag = Save + 0x1D20
        L3_triangle = 0xEFFD
        L3_square = 0x7FFD
        L3_circle = 0xDFFD
        L3_cross = 0xBFFD
        L3_L1 = 0xFBFD
        L3_L2 = 0xFEFD
        L3_R1 = 0xF7FD
        L3_R2 = 0xFDFD
        L3_R3_triangle = 0xEFF9
        L3_R3_circle = 0xDFF9
        L3_R3_square = 0x7FF9
        R3_R1 = 0xF7FB
        R3_L1 = 0xFBFB
    elseif GAME_ID == 0x431219CC and ENGINE_TYPE == 'BACKEND' then --PC
        if ReadString(0x09A92F0,4) == 'KH2J' then --EGS
            ConsolePrint("PC version (EGS) detected")
            Sys3Pointer = 0x2AE5890
	    Btl0Pointer = 0x2AE5898
            Sys3 = ReadLong(Sys3Pointer)
	    Btl0 = ReadLong(Btl0Pointer)
            Save = 0x09A92F0
	    Now = 0x0716DF8
            battle_state_address = 0x2A10E44
            pause_status_address = 0x0ABB2B8
            is_controllable_address = 0x2A16C28
            input = Now - 0x3970
            cursor2 = 0x2A103FC
            sora_unit_stat = 0x2A22FD8
            party1_unit_stat = sora_unit_stat - 0x278
            party2_unit_stat = party1_unit_stat - 0x278
            sora_level_stat = Btl0 + 0x25928
            donald_level_stat = Btl0 + 0x25F5C
            goofy_level_stat = Btl0 + 0x26590
            mickey_level_stat = Btl0 + 0x26BC4
            auron_level_stat = Btl0 + 0x271F8
            mulan_level_stat = Btl0 + 0x2782C
            aladdin_level_stat = Btl0 + 0x27E60
            jack_sparrow_level_stat = Btl0 + 0x28494
            beast_level_stat = 	Btl0 + 0x28AC8
            jack_skellington_level_stat = Btl0 + 0x290FC
            simba_level_stat = Btl0 + 0x29730
            tron_level_stat = Btl0 + 0x29D64
            riku_level_stat = Btl0 + 0x2A398
            sora_party_stat = Save + 0x24F0
            donald_party_stat = Save + 0x2604
            goofy_party_stat = Save + 0x2718
            mickey_party_stat = Save + 0x282C
            auron_party_stat = Save + 0x2940
            mulan_party_stat = Save + 0x2A54
            aladdin_party_stat = Save + 0x2B68
            jack_sparrow_party_stat = Save + 0x2C7C
            beast_party_stat = Save + 0x2D90
            jack_skellington_party_stat = Save + 0x2EA4
            simba_party_stat = Save + 0x2FB8
            tron_party_stat = Save + 0x30CC
            riku_party_stat = Save + 0x31E0
            valor_cost = Sys3 + 0x03E0
            wisdom_cost = Sys3 + 0x0410
            limit_cost = Sys3 + 0x7A30
            master_cost = Sys3 + 0x04A0
            final_cost = Sys3 + 0x04D0
            auto_valor_cost = Sys3 + 0x6440
            auto_wisdom_cost = Sys3 + 0x6470
            auto_limit_cost = Sys3 + 0x7A60
            auto_master_cost = Sys3 + 0x64A0
            auto_final_cost = Sys3 + 0x64D0
            chiken_little_cost = Sys3 + 0x5180
            genie_cost = Sys3 + 0x10A0
            stitch_cost = Sys3 + 0x1070
            peter_pan_cost = Sys3 + 0x37A0
            sora_cure = Save + 0x3597
            cure1_flag = Save + 0x1D31
            cure2_flag = Save + 0x1D19
            cure3_flag = Save + 0x1D20
            L3_triangle = 0x1002
            L3_square = 0x8002
            L3_circle = 0x2002
            L3_cross = 0x4002
            L3_L1 = 0x402
            L3_L2 = 0x102
            L3_R1 = 0x802
            L3_R2 = 0x202
            L3_R3_triangle = 0x1006
            L3_R3_circle = 0x2006
            L3_R3_square = 0x8006
            R3_R1 = 0x804
            R3_L1 = 0x0404
	    elseif ReadString(0x09A9830,4) == 'KH2J' then --Steam Global
            ConsolePrint("PC version (Steam Global) detected")
            Sys3Pointer = 0x2AE5DD0
	    Btl0Pointer = 0x2AE5DD8
            Sys3 = ReadLong(Sys3Pointer)
	    Btl0 = ReadLong(Btl0Pointer)
            Save = 0x09A9830
	    Now = 0x0717008
            battle_state_address = 0x2A11384
            pause_status_address = 0x0ABB7F8
            is_controllable_address = 0x2A17168
            input = Now - 0x3970
            cursor2 = 0x2A1093C
            sora_unit_stat = 0x2A23518
            party1_unit_stat = sora_unit_stat - 0x278
            party2_unit_stat = party1_unit_stat - 0x278
            sora_level_stat = Btl0 + 0x25928
            donald_level_stat = Btl0 + 0x25F5C
            goofy_level_stat = Btl0 + 0x26590
            mickey_level_stat = Btl0 + 0x26BC4
            auron_level_stat = Btl0 + 0x271F8
            mulan_level_stat = Btl0 + 0x2782C
            aladdin_level_stat = Btl0 + 0x27E60
            jack_sparrow_level_stat = Btl0 + 0x28494
            beast_level_stat = 	Btl0 + 0x28AC8
            jack_skellington_level_stat = Btl0 + 0x290FC
            simba_level_stat = Btl0 + 0x29730
            tron_level_stat = Btl0 + 0x29D64
            riku_level_stat = Btl0 + 0x2A398
            sora_party_stat = Save + 0x24F0
            donald_party_stat = Save + 0x2604
            goofy_party_stat = Save + 0x2718
            mickey_party_stat = Save + 0x282C
            auron_party_stat = Save + 0x2940
            mulan_party_stat = Save + 0x2A54
            aladdin_party_stat = Save + 0x2B68
            jack_sparrow_party_stat = Save + 0x2C7C
            beast_party_stat = Save + 0x2D90
            jack_skellington_party_stat = Save + 0x2EA4
            simba_party_stat = Save + 0x2FB8
            tron_party_stat = Save + 0x30CC
            riku_party_stat = Save + 0x31E0
            valor_cost = Sys3 + 0x03E0
            wisdom_cost = Sys3 + 0x0410
            limit_cost = Sys3 + 0x7A30
            master_cost = Sys3 + 0x04A0
            final_cost = Sys3 + 0x04D0
            auto_valor_cost = Sys3 + 0x6440
            auto_wisdom_cost = Sys3 + 0x6470
            auto_limit_cost = Sys3 + 0x7A60
            auto_master_cost = Sys3 + 0x64A0
            auto_final_cost = Sys3 + 0x64D0
            chiken_little_cost = Sys3 + 0x5180
            genie_cost = Sys3 + 0x10A0
            stitch_cost = Sys3 + 0x1070
            peter_pan_cost = Sys3 + 0x37A0
            sora_cure = Save + 0x3597
            cure1_flag = Save + 0x1D31
            cure2_flag = Save + 0x1D19
            cure3_flag = Save + 0x1D20
            L3_triangle = 0x1002
            L3_square = 0x8002
            L3_circle = 0x2002
            L3_cross = 0x4002
            L3_L1 = 0x402
            L3_L2 = 0x102
            L3_R1 = 0x802
            L3_R2 = 0x202
            L3_R3_triangle = 0x1006
            L3_R3_circle = 0x2006
            L3_R3_square = 0x8006
            R3_R1 = 0x804
            R3_L1 = 0x0404
	    elseif ReadString(0x09A8830,4) == 'KH2J' then --Steam JP
            ConsolePrint("PC version (Steam JP) detected")
	    Sys3Pointer = 0x2AE4DD0
	    Btl0Pointer = 0x2AE4DD8
            Sys3 = ReadLong(Sys3Pointer)
	    Btl0 = ReadLong(Btl0Pointer)
	    Save = 0x09A8830
	    Now = 0x0716008
            battle_state_address = 0x2A10384
            pause_status_address = 0x0ABA7F8
            is_controllable_address = 0x2A16168
            input = Now - 0x3970
            cursor2 = 0x2A0F93C
            sora_unit_stat = 0x2A22518
            party1_unit_stat = sora_unit_stat - 0x278
            party2_unit_stat = party1_unit_stat - 0x278
            sora_level_stat = Btl0 + 0x25928
            donald_level_stat = Btl0 + 0x25F5C
            goofy_level_stat = Btl0 + 0x26590
            mickey_level_stat = Btl0 + 0x26BC4
            auron_level_stat = Btl0 + 0x271F8
            mulan_level_stat = Btl0 + 0x2782C
            aladdin_level_stat = Btl0 + 0x27E60
            jack_sparrow_level_stat = Btl0 + 0x28494
            beast_level_stat = 	Btl0 + 0x28AC8
            jack_skellington_level_stat = Btl0 + 0x290FC
            simba_level_stat = Btl0 + 0x29730
            tron_level_stat = Btl0 + 0x29D64
            riku_level_stat = Btl0 + 0x2A398
            sora_party_stat = Save + 0x24F0
            donald_party_stat = Save + 0x2604
            goofy_party_stat = Save + 0x2718
            mickey_party_stat = Save + 0x282C
            auron_party_stat = Save + 0x2940
            mulan_party_stat = Save + 0x2A54
            aladdin_party_stat = Save + 0x2B68
            jack_sparrow_party_stat = Save + 0x2C7C
            beast_party_stat = Save + 0x2D90
            jack_skellington_party_stat = Save + 0x2EA4
            simba_party_stat = Save + 0x2FB8
            tron_party_stat = Save + 0x30CC
            riku_party_stat = Save + 0x31E0
            valor_cost = Sys3 + 0x03E0
            wisdom_cost = Sys3 + 0x0410
            limit_cost = Sys3 + 0x7A30
            master_cost = Sys3 + 0x04A0
            final_cost = Sys3 + 0x04D0
            auto_valor_cost = Sys3 + 0x6440
            auto_wisdom_cost = Sys3 + 0x6470
            auto_limit_cost = Sys3 + 0x7A60
            auto_master_cost = Sys3 + 0x64A0
            auto_final_cost = Sys3 + 0x64D0
            chiken_little_cost = Sys3 + 0x5180
            genie_cost = Sys3 + 0x10A0
            stitch_cost = Sys3 + 0x1070
            peter_pan_cost = Sys3 + 0x37A0
            sora_cure = Save + 0x3597
            cure1_flag = Save + 0x1D31
            cure2_flag = Save + 0x1D19
            cure3_flag = Save + 0x1D20
            L3_triangle = 0x1002
            L3_square = 0x8002
            L3_circle = 0x2002
            L3_cross = 0x4002
            L3_L1 = 0x402
            L3_L2 = 0x102
            L3_R1 = 0x802
            L3_R2 = 0x202
            L3_R3_triangle = 0x1006
            L3_R3_circle = 0x2006
            L3_R3_square = 0x8006
            R3_R1 = 0x804
            R3_L1 = 0x0404
        end
    end
end

function _OnFrame()
    if has_to_init == true and frame == 110 then
        address_init()
        if ReadInt(sora_level_stat, true) > 40 then
            ConsolePrint("Rando detected")
            rando_offset = 0x580
        else
            ConsolePrint("Vanilla game detected")
            rando_offset = 0
        end
        apply_zero_defense()
        apply_default_status()
        apply_no_form()
        apply_no_summon()
        has_to_init = false
    end

    frame = frame + 1
    
    if has_to_init == false then
    battle_state = ReadInt(battle_state_address)
	pause_status = ReadInt(pause_status_address)
	is_controllable = ReadByte(is_controllable_address)

    sora_max_mp_charge_time = ReadFloat(sora_unit_stat + 0x1C0)
    party1_max_mp_charge_time = ReadFloat(party1_unit_stat + 0x1C0)
    party2_max_mp_charge_time = ReadFloat(party2_unit_stat + 0x1C0)

    reset_mp_state_if_needed()

    if ReadShort(input) == L3_triangle then
        toggle_hp_slip()
    end

    if ReadShort(input) == L3_square then
        toggle_mp_slip()
    end
    
    if ReadShort(input) == L3_circle then
        toggle_zero_defense()
    end
    
    if ReadShort(input) == L3_cross then
        toggle_default_status()
    end
    
    if ReadShort(input) == L3_L1 then
        toggle_form()
    end

    if ReadShort(input) == L3_L2 then
        toggle_no_summon()
    end

    if ReadShort(input) == L3_R1 then
        toggle_no_items()
    end

    if ReadShort(input) == L3_R2 then
        toggle_no_cure()
    end

    if ReadShort(input) == L3_R3_triangle then
        toggle_no_team_attack()
    end

    if ReadShort(input) == L3_R3_circle then
        toggle_ability_limit()
    end

    if ReadShort(input) == L3_R3_square then
        toggle_no_rc()
    end

    if ReadShort(input) == R3_R1 then
        toggle_full_ability()
    end

    if is_no_items then
        if battle_state == 1 or battle_state == 2 then
            apply_no_items()
        else
            refill_item()
        end
    end

    if is_no_cure then
        apply_no_cure()
    else
        remove_no_cure()
    end

    if is_no_team_attack then
        apply_no_team_attack()
    end

    if is_ability_limit then
        apply_ability_limit()
    end

    if is_no_rc then
        apply_no_rc()
    end

    print_ability()

    if frame == 60 then
        is_ability_printed = false
        is_code_printed = false
    end

    if frame == 120 then
        frame = 0
        if is_hp_slip then
            HP_slip()
        end
        if is_mp_slip then
            MP_slip()
        end
    end
end

function toggle_hp_slip()
    if is_hp_slip then
        if not is_code_printed then
            is_code_printed = true
            is_hp_slip = false
            ConsolePrint("HP slip disabled")
        end
    else
        if not is_code_printed then
            is_code_printed = true
            is_hp_slip = true
            ConsolePrint("HP slip enabled")
        end
    end
end
end


function HP_slip()
    local sora_current_hp = ReadInt(sora_unit_stat)
    local sora_max_hp = ReadInt(sora_unit_stat + 0x4)
    local sora_min_hp = math.floor(sora_max_hp * 0.25)

    local party1_current_hp = ReadInt(party1_unit_stat)
    local party1_max_hp = ReadInt(party1_unit_stat + 0x4)
    local party1_min_hp = math.floor(party1_max_hp * 0.25)

    local party2_current_hp = ReadInt(party2_unit_stat)
    local party2_max_hp = ReadInt(party2_unit_stat + 0x4)
    local party2_min_hp = math.floor(party2_max_hp * 0.25)

    if battle_state == 1 or battle_state == 2 then
        if pause_status == 0 and is_controllable == 0 then
            if sora_current_hp > sora_min_hp + 1 then
                WriteInt(sora_unit_stat, (sora_current_hp - 1))
            end
            if party1_current_hp > party1_min_hp + 1 then
                WriteInt(party1_unit_stat, (party1_current_hp - 1))
            end
            if party2_current_hp > party2_min_hp + 1 then
                WriteInt(party2_unit_stat, (party2_current_hp - 1))
            end
        end
    end
end

function reset_mp_state_if_needed()
    if pause_status == 4 then
        sora_is_mp_charging = 0
        party1_is_mp_charging = 0
        party2_is_mp_charging = 0
    end
    if sora_max_mp_charge_time == 0 then
        sora_is_mp_charging = 0
    end
    if party1_max_mp_charge_time == 0 then
        party1_is_mp_charging = 0
    end
    if party2_max_mp_charge_time == 0 then
        party2_is_mp_charging = 0
    end
end

function toggle_mp_slip()
    if is_mp_slip then
        if not is_code_printed then
            is_code_printed = true
            is_mp_slip = false
            ConsolePrint("MP slip disabled")
        end
    else
        if not is_code_printed then
            is_code_printed = true
            is_mp_slip = true
            ConsolePrint("MP slip enabled")
        end
    end
end

function MP_slip()
    local sora_current_mp = ReadInt(sora_unit_stat + 0x180)
    local sora_max_mp = ReadInt(sora_unit_stat + 0x184)
    local sora_current_mp_charge_time = ReadFloat(sora_unit_stat + 0x1BC)

    local party1_current_mp = ReadInt(party1_unit_stat + 0x180)
    local party1_max_mp = ReadInt(party1_unit_stat + 0x184)
    local party1_current_mp_charge_time = ReadFloat(party1_unit_stat + 0x1BC)

    local party2_current_mp = ReadInt(party2_unit_stat + 0x180)
    local party2_max_mp = ReadInt(party2_unit_stat + 0x184)
    local party2_current_mp_charge_time = ReadFloat(party2_unit_stat + 0x1BC)

    if battle_state == 1 or battle_state == 2 then
        if pause_status == 0 and is_controllable == 0 then
            if sora_max_mp_charge_time ~= 0 then
                sora_is_mp_charging = sora_is_mp_charging + 1
                if sora_is_mp_charging == 1 then
                    WriteFloat(sora_unit_stat + 0x1C0, 2 * sora_max_mp_charge_time)
                    WriteFloat(sora_unit_stat + 0x1BC, 2 * sora_current_mp_charge_time)
                end 
            elseif sora_current_mp > 1 then
                sora_is_mp_charging = 0
                WriteInt(sora_unit_stat + 0x180, sora_current_mp - 1)
            end
            if party1_max_mp_charge_time ~= 0 then
                party1_is_mp_charging = party1_is_mp_charging + 1
                if party1_is_mp_charging == 1 then
                    WriteFloat(party1_unit_stat + 0x1C0, 2 * party1_max_mp_charge_time)
                    WriteFloat(party1_unit_stat + 0x1BC, 2 * party1_current_mp_charge_time)
                end 
            elseif party1_current_mp > 1 then
                party1_is_mp_charging = 0
                WriteInt(party1_unit_stat + 0x180, party1_current_mp - 1)
            end
            if party2_max_mp_charge_time ~= 0 then
                party2_is_mp_charging = party2_is_mp_charging + 1
                if party2_is_mp_charging == 1 then
                    WriteFloat(party2_unit_stat + 0x1C0, 2 * party2_max_mp_charge_time)
                    WriteFloat(party2_unit_stat + 0x1BC, 2 * party2_current_mp_charge_time)
                end 
            elseif party2_current_mp > 1 then
                party2_is_mp_charging = 0
                WriteInt(party2_unit_stat + 0x180, party2_current_mp - 1)
            end
        end
    else
        if sora_max_mp_charge_time ~= 0 then
            sora_is_mp_charging = sora_is_mp_charging + 1
        end
        if party1_max_mp_charge_time ~= 0 then
            party1_is_mp_charging = party1_is_mp_charging + 1
        end
        if party2_max_mp_charge_time ~= 0 then
            party2_is_mp_charging = party2_is_mp_charging + 1
        end
    end
end

function toggle_zero_defense()
    if is_zero_defense then
        if not is_code_printed then
            is_code_printed = true
            is_zero_defense = false
            ConsolePrint("Zero defense disabled")
            update_level_stats()
        end
    else
        if not is_code_printed then
            apply_zero_defense()
            is_code_printed = true
            is_zero_defense = true
            ConsolePrint("Zero defense enabled")
        end
    end
end

function apply_zero_defense()
    for i = 0, 98 do
        if characters_level_stat[1][i + 1][3] == nil then
            characters_level_stat[1][i + 1][3] = ReadByte(sora_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level_stat[2][i + 1][3] = ReadByte(donald_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level_stat[3][i + 1][3] = ReadByte(goofy_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level_stat[4][i + 1][3] = ReadByte(mickey_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level_stat[5][i + 1][3] = ReadByte(auron_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level_stat[6][i + 1][3] = ReadByte(mulan_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level_stat[7][i + 1][3] = ReadByte(aladdin_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level_stat[8][i + 1][3] = ReadByte(jack_sparrow_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level_stat[9][i + 1][3] = ReadByte(beast_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level_stat[10][i + 1][3] = ReadByte(jack_skellington_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level_stat[11][i + 1][3] = ReadByte(simba_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level_stat[12][i + 1][3] = ReadByte(tron_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level_stat[13][i + 1][3] = ReadByte(riku_level_stat + 0x6 + 0x10*i + rando_offset, true)

        end
        WriteByte(sora_level_stat + 0x6 + 0x10*i + rando_offset, 0, true)
        WriteByte(donald_level_stat + 0x6 + 0x10*i + rando_offset, 0, true)
        WriteByte(goofy_level_stat + 0x6 + 0x10*i + rando_offset, 0, true)
        WriteByte(mickey_level_stat + 0x6 + 0x10*i + rando_offset, 0, true)
        WriteByte(auron_level_stat + 0x6 + 0x10*i + rando_offset, 0, true)
        WriteByte(mulan_level_stat + 0x6 + 0x10*i + rando_offset, 0, true)
        WriteByte(aladdin_level_stat + 0x6 + 0x10*i + rando_offset, 0, true)
        WriteByte(jack_sparrow_level_stat + 0x6 + 0x10*i + rando_offset, 0, true)
        WriteByte(beast_level_stat + 0x6 + 0x10*i + rando_offset, 0, true)
        WriteByte(jack_skellington_level_stat + 0x6 + 0x10*i + rando_offset, 0, true)
        WriteByte(simba_level_stat + 0x6 + 0x10*i + rando_offset, 0, true)
        WriteByte(tron_level_stat + 0x6 + 0x10*i + rando_offset, 0, true)
        WriteByte(riku_level_stat + 0x6 + 0x10*i + rando_offset, 0, true)
    end
end

function toggle_default_status()
    if is_default_status then
        if not is_code_printed then
            is_code_printed = true
            is_default_status = false
            update_level_stats()
            ConsolePrint("default status disabled")
        end
    else
        if not is_code_printed then
            is_code_printed = true
            is_default_status = true
            apply_default_status()
            ConsolePrint("default status enabled")
        end
    end
end

function apply_default_status()
    for i = 0, 98 do
        if characters_level_stat[1][i + 1][1] == nil then
            characters_level_stat[1][i + 1][1] = ReadByte(sora_level_stat + 0x4 + 0x10*i + rando_offset, true)
            characters_level_stat[1][i + 1][2] = ReadByte(sora_level_stat + 0x5 + 0x10*i + rando_offset, true)
            characters_level_stat[2][i + 1][1] = ReadByte(donald_level_stat + 0x4 + 0x10*i + rando_offset, true)
            characters_level_stat[2][i + 1][2] = ReadByte(donald_level_stat + 0x5 + 0x10*i + rando_offset, true)
            characters_level_stat[3][i + 1][1] = ReadByte(goofy_level_stat + 0x4 + 0x10*i + rando_offset, true)
            characters_level_stat[3][i + 1][2] = ReadByte(goofy_level_stat + 0x5 + 0x10*i + rando_offset, true)
            characters_level_stat[4][i + 1][1] = ReadByte(mickey_level_stat + 0x4 + 0x10*i + rando_offset, true)
            characters_level_stat[4][i + 1][2] = ReadByte(mickey_level_stat + 0x5 + 0x10*i + rando_offset, true)
            characters_level_stat[5][i + 1][1] = ReadByte(auron_level_stat + 0x4 + 0x10*i + rando_offset, true)
            characters_level_stat[5][i + 1][2] = ReadByte(auron_level_stat + 0x5 + 0x10*i + rando_offset, true)
            characters_level_stat[6][i + 1][1] = ReadByte(mulan_level_stat + 0x4 + 0x10*i + rando_offset, true)
            characters_level_stat[6][i + 1][2] = ReadByte(mulan_level_stat + 0x5 + 0x10*i + rando_offset, true)
            characters_level_stat[7][i + 1][1] = ReadByte(aladdin_level_stat + 0x4 + 0x10*i + rando_offset, true)
            characters_level_stat[7][i + 1][2] = ReadByte(aladdin_level_stat + 0x5 + 0x10*i + rando_offset, true)
            characters_level_stat[8][i + 1][1] = ReadByte(jack_sparrow_level_stat + 0x4 + 0x10*i + rando_offset, true)
            characters_level_stat[8][i + 1][2] = ReadByte(jack_sparrow_level_stat + 0x5 + 0x10*i + rando_offset, true)
            characters_level_stat[9][i + 1][1] = ReadByte(beast_level_stat + 0x4 + 0x10*i + rando_offset, true)
            characters_level_stat[9][i + 1][2] = ReadByte(beast_level_stat + 0x5 + 0x10*i + rando_offset, true)
            characters_level_stat[10][i + 1][1] = ReadByte(jack_skellington_level_stat + 0x4 + 0x10*i + rando_offset, true)
            characters_level_stat[10][i + 1][2] = ReadByte(jack_skellington_level_stat + 0x5 + 0x10*i + rando_offset, true)
            characters_level_stat[11][i + 1][1] = ReadByte(simba_level_stat + 0x4 + 0x10*i + rando_offset, true)
            characters_level_stat[11][i + 1][2] = ReadByte(simba_level_stat + 0x5 + 0x10*i + rando_offset, true)
            characters_level_stat[12][i + 1][1] = ReadByte(tron_level_stat + 0x4 + 0x10*i + rando_offset, true)
            characters_level_stat[12][i + 1][2] = ReadByte(tron_level_stat + 0x5 + 0x10*i + rando_offset, true)
            characters_level_stat[13][i + 1][1] = ReadByte(riku_level_stat + 0x4 + 0x10*i + rando_offset, true)
            characters_level_stat[13][i + 1][2] = ReadByte(riku_level_stat + 0x5 + 0x10*i + rando_offset, true)
        end
        if characters_level_stat[1][i + 1][3] == nil then
            characters_level[1][i + 1][3] = ReadByte(sora_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level[2][i + 1][3] = ReadByte(donald_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level[3][i + 1][3] = ReadByte(goofy_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level[4][i + 1][3] = ReadByte(mickey_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level[5][i + 1][3] = ReadByte(auron_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level[6][i + 1][3] = ReadByte(mulan_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level[7][i + 1][3] = ReadByte(aladdin_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level[8][i + 1][3] = ReadByte(jack_sparrow_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level[9][i + 1][3] = ReadByte(beast_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level[10][i + 1][3] = ReadByte(jack_skellington_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level[11][i + 1][3] = ReadByte(simba_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level[12][i + 1][3] = ReadByte(tron_level_stat + 0x6 + 0x10*i + rando_offset, true)
            characters_level[13][i + 1][3] = ReadByte(riku_level_stat + 0x6 + 0x10*i + rando_offset, true)

        end
        WriteByte(sora_level_stat + 0x4 + 0x10*i + rando_offset, 2, true)
        WriteByte(sora_level_stat + 0x5 + 0x10*i + rando_offset, 6, true)
        WriteByte(donald_level_stat + 0x4 + 0x10*i + rando_offset, 1, true)
        WriteByte(donald_level_stat + 0x5 + 0x10*i + rando_offset, 5, true)
        WriteByte(goofy_level_stat + 0x4 + 0x10*i + rando_offset, 5, true)
        WriteByte(goofy_level_stat + 0x5 + 0x10*i + rando_offset, 0, true)
        WriteByte(mickey_level_stat + 0x4 + 0x10*i + rando_offset, 4, true)
        WriteByte(mickey_level_stat + 0x5 + 0x10*i + rando_offset, 7, true)
        WriteByte(auron_level_stat + 0x4 + 0x10*i + rando_offset, 4, true)
        WriteByte(auron_level_stat + 0x5 + 0x10*i + rando_offset, 0, true)
        WriteByte(mulan_level_stat + 0x4 + 0x10*i + rando_offset, 4, true)
        WriteByte(mulan_level_stat + 0x5 + 0x10*i + rando_offset, 7, true)
        WriteByte(aladdin_level_stat + 0x4 + 0x10*i + rando_offset, 4, true)
        WriteByte(aladdin_level_stat + 0x5 + 0x10*i + rando_offset, 0, true)
        WriteByte(jack_sparrow_level_stat + 0x4 + 0x10*i + rando_offset, 4, true)
        WriteByte(jack_sparrow_level_stat + 0x5 + 0x10*i + rando_offset, 0, true)
        WriteByte(beast_level_stat + 0x4 + 0x10*i + rando_offset, 4, true)
        WriteByte(beast_level_stat + 0x5 + 0x10*i + rando_offset, 0, true)
        WriteByte(jack_skellington_level_stat + 0x4 + 0x10*i + rando_offset, 4, true)
        WriteByte(jack_skellington_level_stat + 0x5 + 0x10*i + rando_offset, 7, true)
        WriteByte(simba_level_stat + 0x4 + 0x10*i + rando_offset, 4, true)
        WriteByte(simba_level_stat + 0x5 + 0x10*i + rando_offset, 7, true)
        WriteByte(tron_level_stat + 0x4 + 0x10*i + rando_offset, 4, true)
        WriteByte(tron_level_stat + 0x5 + 0x10*i + rando_offset, 7, true)
        WriteByte(riku_level_stat + 0x4 + 0x10*i + rando_offset, 4, true)
        WriteByte(riku_level_stat + 0x5 + 0x10*i + rando_offset, 7, true)
        if not is_zero_defense then
            WriteByte(sora_level_stat + 0x6 + 0x10*i + rando_offset, 2, true)
            WriteByte(donald_level_stat + 0x6 + 0x10*i + rando_offset, 2, true)
            WriteByte(goofy_level_stat + 0x6 + 0x10*i + rando_offset, 2, true)
            WriteByte(mickey_level_stat + 0x6 + 0x10*i + rando_offset, 4, true)
            WriteByte(auron_level_stat + 0x6 + 0x10*i + rando_offset, 5, true)
            WriteByte(mulan_level_stat + 0x6 + 0x10*i + rando_offset, 5, true)
            WriteByte(aladdin_level_stat + 0x6 + 0x10*i + rando_offset, 5, true)
            WriteByte(jack_sparrow_level_stat + 0x6 + 0x10*i + rando_offset, 5, true)
            WriteByte(beast_level_stat + 0x6 + 0x10*i + rando_offset, 5, true)
            WriteByte(jack_skellington_level_stat + 0x6 + 0x10*i + rando_offset, 4, true)
            WriteByte(simba_level_stat + 0x6 + 0x10*i + rando_offset, 4, true)
            WriteByte(tron_level_stat + 0x6 + 0x10*i + rando_offset, 4, true)
            WriteByte(riku_level_stat + 0x6 + 0x10*i + rando_offset, 4, true)
        end
    end
end

function update_level_stats()
    if (not is_zero_defense) and (not (characters_level_stat[1][1][3] == nil)) then
        for i = 0, 98 do
            WriteByte(sora_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[1][i + 1][3], true)
            WriteByte(donald_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[2][i + 1][3], true)
            WriteByte(goofy_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[3][i + 1][3], true)
            WriteByte(mickey_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[4][i + 1][3], true)
            WriteByte(auron_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[5][i + 1][3], true)
            WriteByte(mulan_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[6][i + 1][3], true)
            WriteByte(aladdin_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[7][i + 1][3], true)
            WriteByte(jack_sparrow_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[8][i + 1][3], true)
            WriteByte(beast_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[9][i + 1][3], true)
            WriteByte(jack_skellington_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[10][i + 1][3], true)
            WriteByte(simba_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[11][i + 1][3], true)
            WriteByte(tron_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[12][i + 1][3], true)
            WriteByte(riku_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[13][i + 1][3], true)
        end
    end
    if (not is_default_status) and (not (characters_level_stat[1][1][1] == nil)) then
        for i = 0, 98 do
            WriteByte(sora_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[1][i + 1][1], true)
            WriteByte(sora_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[1][i + 1][2], true)
            WriteByte(donald_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[2][i + 1][1], true)
            WriteByte(donald_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[2][i + 1][2], true)
            WriteByte(goofy_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[3][i + 1][1], true)
            WriteByte(goofy_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[3][i + 1][2], true)
            WriteByte(mickey_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[4][i + 1][1], true)
            WriteByte(mickey_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[4][i + 1][2], true)
            WriteByte(auron_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[5][i + 1][1], true)
            WriteByte(auron_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[5][i + 1][2], true)
            WriteByte(mulan_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[6][i + 1][1], true)
            WriteByte(mulan_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[6][i + 1][2], true)
            WriteByte(aladdin_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[7][i + 1][1], true)
            WriteByte(aladdin_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[7][i + 1][2], true)
            WriteByte(jack_sparrow_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[8][i + 1][1], true)
            WriteByte(jack_sparrow_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[8][i + 1][2], true)
            WriteByte(beast_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[9][i + 1][1], true)
            WriteByte(beast_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[9][i + 1][2], true)
            WriteByte(jack_skellington_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[10][i + 1][1], true)
            WriteByte(jack_skellington_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[10][i + 1][2], true)
            WriteByte(simba_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[11][i + 1][1], true)
            WriteByte(simba_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[11][i + 1][2], true)
            WriteByte(tron_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[12][i + 1][1], true)
            WriteByte(tron_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[12][i + 1][2], true)
            WriteByte(riku_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[13][i + 1][1], true)
            WriteByte(riku_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[13][i + 1][2], true)
        end
    end
end

function toggle_no_items()
    if is_no_items then
        if not is_code_printed then
            is_no_items = false
            is_code_printed = true
            refill_item()
            ConsolePrint("No items disabled")
        end
    else 
        if not is_code_printed then
            is_no_items = true
            is_code_printed = true
            apply_no_items()
            ConsolePrint("No items enabled")
        end
    end
end

function apply_no_items()
    if not refill_items then
        for i = 0, 7 do
            --save current items
            characters_items[1][i+1] = ReadByte(sora_party_stat + 0x34 + 0x2*i)
            characters_items_reload[1][i+1] = ReadByte(sora_party_stat + 0x44 + 0x2*i)
            characters_items[2][i+1] = ReadByte(donald_party_stat + 0x34 + 0x2*i)
            characters_items_reload[2][i+1] = ReadByte(donald_party_stat + 0x44 + 0x2*i)
            characters_items[3][i+1] = ReadByte(goofy_party_stat + 0x34 + 0x2*i)
            characters_items_reload[3][i+1] = ReadByte(goofy_party_stat + 0x44 + 0x2*i)
            characters_items[4][i+1] = ReadByte(mickey_party_stat + 0x34 + 0x2*i)
            characters_items_reload[4][i+1] = ReadByte(mickey_party_stat + 0x44 + 0x2*i)
            characters_items[5][i+1] = ReadByte(auron_party_stat + 0x34 + 0x2*i)
            characters_items_reload[5][i+1] = ReadByte(auron_party_stat + 0x44 + 0x2*i)
            characters_items[6][i+1] = ReadByte(mulan_party_stat + 0x34 + 0x2*i)
            characters_items_reload[6][i+1] = ReadByte(mulan_party_stat + 0x44 + 0x2*i)
            characters_items[7][i+1] = ReadByte(aladdin_party_stat + 0x34 + 0x2*i)
            characters_items_reload[7][i+1] = ReadByte(aladdin_party_stat + 0x44 + 0x2*i)
            characters_items[8][i+1] = ReadByte(jack_sparrow_party_stat + 0x34 + 0x2*i)
            characters_items_reload[8][i+1] = ReadByte(jack_sparrow_party_stat + 0x44 + 0x2*i)
            characters_items[9][i+1] = ReadByte(beast_party_stat + 0x34 + 0x2*i)
            characters_items_reload[9][i+1] = ReadByte(beast_party_stat + 0x44 + 0x2*i)
            characters_items[10][i+1] = ReadByte(jack_skellington_party_stat + 0x34 + 0x2*i)
            characters_items_reload[10][i+1] = ReadByte(jack_skellington_party_stat + 0x44 + 0x2*i)
            characters_items[11][i+1] = ReadByte(simba_party_stat + 0x34 + 0x2*i)
            characters_items_reload[11][i+1] = ReadByte(simba_party_stat + 0x44 + 0x2*i)
            characters_items[12][i+1] = ReadByte(tron_party_stat + 0x34 + 0x2*i)
            characters_items_reload[12][i+1] = ReadByte(tron_party_stat + 0x44 + 0x2*i)
            characters_items[13][i+1] = ReadByte(riku_party_stat + 0x34 + 0x2*i)
            characters_items_reload[13][i+1] = ReadByte(riku_party_stat + 0x44 + 0x2*i)
            --remove items
            WriteByte(sora_party_stat + 0x44 + 0X2*i, 0)
            WriteByte(sora_party_stat + 0x34 + 0X2*i, 0)
            WriteByte(donald_party_stat + 0x44 + 0X2*i, 0)
            WriteByte(donald_party_stat + 0x34 + 0X2*i, 0)
            WriteByte(goofy_party_stat + 0x44 + 0X2*i, 0)
            WriteByte(goofy_party_stat + 0x34 + 0X2*i, 0)
            WriteByte(mickey_party_stat + 0x44 + 0X2*i, 0)
            WriteByte(mickey_party_stat + 0x34 + 0X2*i, 0)
            WriteByte(auron_party_stat + 0x44 + 0X2*i, 0)
            WriteByte(auron_party_stat + 0x34 + 0X2*i, 0)
            WriteByte(mulan_party_stat + 0x44 + 0X2*i, 0)
            WriteByte(mulan_party_stat + 0x34 + 0X2*i, 0)
            WriteByte(aladdin_party_stat + 0x44 + 0X2*i, 0)
            WriteByte(aladdin_party_stat + 0x34 + 0X2*i, 0)
            WriteByte(jack_sparrow_party_stat + 0x44 + 0X2*i, 0)
            WriteByte(jack_sparrow_party_stat + 0x34 + 0X2*i, 0)
            WriteByte(beast_party_stat + 0x44 + 0X2*i, 0)
            WriteByte(beast_party_stat + 0x34 + 0X2*i, 0)
            WriteByte(jack_skellington_party_stat + 0x44 + 0X2*i, 0)
            WriteByte(jack_skellington_party_stat + 0x34 + 0X2*i, 0)
            WriteByte(simba_party_stat + 0x44 + 0X2*i, 0)
            WriteByte(simba_party_stat + 0x34 + 0X2*i, 0)
            WriteByte(tron_party_stat + 0x44 + 0X2*i, 0)
            WriteByte(tron_party_stat + 0x34 + 0X2*i, 0)
            WriteByte(riku_party_stat + 0x44 + 0X2*i, 0)
            WriteByte(riku_party_stat + 0x34 + 0X2*i, 0)
        end
        refill_items = true
    end
end

function refill_item()
    if (not (characters_items[1][1] == nil)) and refill_items then
        refill_items = false
        for i = 0, 7 do
            WriteByte(sora_party_stat + 0x34 + 0x2*i, characters_items[1][i+1])
            WriteByte(sora_party_stat + 0x44 + 0x2*i, characters_items_reload[1][i+1])
            WriteByte(donald_party_stat + 0x34 + 0x2*i, characters_items[2][i+1])
            WriteByte(donald_party_stat + 0x44 + 0x2*i, characters_items_reload[2][i+1])
            WriteByte(goofy_party_stat + 0x34 + 0x2*i, characters_items[3][i+1])
            WriteByte(goofy_party_stat + 0x44 + 0x2*i, characters_items_reload[3][i+1])
            WriteByte(mickey_party_stat + 0x34 + 0x2*i, characters_items[4][i+1])
            WriteByte(mickey_party_stat + 0x44 + 0x2*i, characters_items_reload[4][i+1])
            WriteByte(auron_party_stat + 0x34 + 0x2*i, characters_items[5][i+1])
            WriteByte(auron_party_stat + 0x44 + 0x2*i, characters_items_reload[5][i+1])
            WriteByte(mulan_party_stat + 0x34 + 0x2*i, characters_items[6][i+1])
            WriteByte(mulan_party_stat + 0x44 + 0x2*i, characters_items_reload[6][i+1])
            WriteByte(aladdin_party_stat + 0x34 + 0x2*i, characters_items[7][i+1])
            WriteByte(aladdin_party_stat + 0x44 + 0x2*i, characters_items_reload[7][i+1])
            WriteByte(jack_sparrow_party_stat + 0x34 + 0x2*i, characters_items[8][i+1])
            WriteByte(jack_sparrow_party_stat + 0x44 + 0x2*i, characters_items_reload[8][i+1])
            WriteByte(beast_party_stat + 0x34 + 0x2*i, characters_items[9][i+1])
            WriteByte(beast_party_stat + 0x44 + 0x2*i, characters_items_reload[9][i+1])
            WriteByte(jack_skellington_party_stat + 0x34 + 0x2*i, characters_items[10][i+1])
            WriteByte(jack_skellington_party_stat + 0x44 + 0x2*i, characters_items_reload[10][i+1])
            WriteByte(simba_party_stat + 0x34 + 0x2*i, characters_items[11][i+1])
            WriteByte(simba_party_stat + 0x44 + 0x2*i, characters_items_reload[11][i+1])
            WriteByte(tron_party_stat + 0x34 + 0x2*i, characters_items[12][i+1])
            WriteByte(tron_party_stat + 0x44 + 0x2*i, characters_items_reload[12][i+1])
            WriteByte(riku_party_stat + 0x34 + 0x2*i, characters_items[13][i+1])
            WriteByte(riku_party_stat + 0x44 + 0x2*i, characters_items_reload[13][i+1])
        end
    end
end

function toggle_form()
    if is_no_form then
        if not is_code_printed then
            is_code_printed = true
            is_no_form = false
            remove_no_form()
            ConsolePrint("No form disabled")
        end
    else
        if not is_code_printed then
            is_code_printed = true
            is_no_form = true
            apply_no_form()
            ConsolePrint("No form enabled")
        end
    end
end

function apply_no_form()
    if drive_cost[1][1] == nil then
        drive_cost[1][1] = ReadByte(valor_cost + rando_offset, true)
        drive_cost[2][1] = ReadByte(auto_valor_cost + rando_offset, true)
        drive_cost[1][2] = ReadByte(wisdom_cost + rando_offset, true)
        drive_cost[2][2] = ReadByte(wisdom_cost + rando_offset, true)
        drive_cost[1][3] = ReadByte(limit_cost + rando_offset, true)
        drive_cost[2][3] = ReadByte(auto_limit_cost + rando_offset, true)
        drive_cost[1][4] = ReadByte(master_cost + rando_offset, true)
        drive_cost[2][4] = ReadByte(auto_master_cost + rando_offset, true)
        drive_cost[1][5] = ReadByte(final_cost + rando_offset, true)
        drive_cost[2][5] = ReadByte(auto_final_cost + rando_offset, true)
    end
        WriteByte(valor_cost + rando_offset, 10, true)
        WriteByte(auto_valor_cost + rando_offset, 10, true)
        WriteByte(wisdom_cost + rando_offset, 10, true)
        WriteByte(auto_wisdom_cost + rando_offset, 10, true)
        WriteByte(limit_cost + rando_offset, 10, true)
        WriteByte(auto_limit_cost + rando_offset, 10, true)
        WriteByte(master_cost + rando_offset, 10, true)
        WriteByte(auto_master_cost + rando_offset, 10, true)
        WriteByte(final_cost + rando_offset, 10, true)
        WriteByte(auto_final_cost + rando_offset, 10, true)
end

function remove_no_form()
    if not (drive_cost[1][1] == nil) then
        WriteByte(valor_cost + rando_offset, drive_cost[1][1], true)
        WriteByte(auto_valor_cost + rando_offset, drive_cost[2][1], true)
        WriteByte(wisdom_cost + rando_offset, drive_cost[1][2], true)
        WriteByte(auto_wisdom_cost + rando_offset, drive_cost[2][2], true)
        WriteByte(limit_cost + rando_offset, drive_cost[1][3], true)
        WriteByte(auto_limit_cost + rando_offset, drive_cost[2][3], true)
        WriteByte(master_cost + rando_offset, drive_cost[1][4], true)
        WriteByte(auto_master_cost + rando_offset, drive_cost[2][4], true)
        WriteByte(final_cost + rando_offset, drive_cost[1][5], true)
        WriteByte(auto_final_cost + rando_offset, drive_cost[2][5], true)
    end 
end

function toggle_no_summon()
    if is_no_summon then
        if not is_code_printed then
            remove_no_summon()
            is_code_printed = true
            is_no_summon = false
            ConsolePrint("No summon disabled")
        end
    else
        if not is_code_printed then
            apply_no_summon()
            is_no_summon = true
            is_code_printed = true
            ConsolePrint("No summon enabled")
        end
    end
end

function apply_no_summon()
    if summon_cost[0] == nil then
        summon_cost[1] = ReadByte(chiken_little_cost + rando_offset, true)
        summon_cost[2] = ReadByte(genie_cost + rando_offset, true)
        summon_cost[3] = ReadByte(stitch_cost + rando_offset, true)
        summon_cost[4] = ReadByte(peter_pan_cost + rando_offset, true)
    end
    WriteByte(chiken_little_cost + rando_offset, 10, true)
    WriteByte(genie_cost + rando_offset, 10, true)
    WriteByte(stitch_cost + rando_offset, 10, true)
    WriteByte(peter_pan_cost + rando_offset, 10, true)
end

function remove_no_summon()
    if not (summon_cost[1] == nil) then
        WriteByte(chiken_little_cost + rando_offset, summon_cost[1], true)
        WriteByte(genie_cost + rando_offset, summon_cost[2], true)
        WriteByte(stitch_cost + rando_offset, summon_cost[3], true)
        WriteByte(peter_pan_cost + rando_offset, summon_cost[4], true)
    end
end

function toggle_no_cure()
    if is_no_cure then
        if not is_code_printed then
            is_no_cure = false
            is_code_printed = true
            ConsolePrint("No cure disabled (take effect at next room transition)")
        end
    else
        if not is_code_printed then
            is_no_cure = true
            is_code_printed = true
            ConsolePrint("No cure enabled (take effect at next room transition)")
        end
    end
end

function apply_no_cure()
    is_remove_no_cure = true
    if ReadByte(sora_cure) == 1 then
        cure_count = cure_count + 1
    elseif ReadByte(sora_cure) > 1 then
        cure_count = ReadByte(sora_cure)
    end
    WriteByte(sora_cure, 0)
    for i = 0, 79 do
        if ReadShort(donald_party_stat + 0x54 + 0x2 * i) == 0x80A8 then
            WriteShort(donald_party_stat + 0x54 + 0x2 * i, 0x00A8)
        end
        if ReadShort(auron_party_stat + 0x54 + 0x2 * i) == 0x80B0 then
            WriteShort(auron_party_stat + 0x54 + 0x2 * i, 0x00B0)
        end
        if ReadShort(riku_party_stat + 0x54 + 0x2 * i) == 0x80BB then
            WriteShort(riku_party_stat + 0x54 + 0x2 * i, 0x00BB)
        end
        if ReadShort(simba_party_stat + 0x54 + 0x2 * i) == 0x80BE then
            WriteShort(simba_party_stat + 0x54 + 0x2 * i, 0x00BE)
        end
    end
end

function remove_no_cure()
    if is_remove_no_cure then
        if rando_offset == 0 then
            if ReadByte(cure1_flag) > 250 then
                WriteByte(sora_cure, 1)
            end
            if ReadByte(cure2_flag) > 6 then
                WriteByte(sora_cure, 2)
            end
            if ReadByte(cure3_flag) > 78 then
                WriteByte(sora_cure, 3)
            end
        else
            WriteByte(sora_cure, cure_count)
        end
    end
    is_remove_no_cure = false
end

function toggle_no_team_attack()
    if is_no_team_attack then
        if not is_code_printed then
            is_no_team_attack = false
            is_code_printed = true
            ConsolePrint("No team attack disabled")
        end
    else 
        if not is_code_printed then
            is_no_team_attack = true
            is_code_printed = true
            ConsolePrint("No team attack enabled")
        end
    end
end

function apply_no_team_attack() 
    if ReadInt(cursor2) == 3 then
        WriteInt(cursor2, 0)
    end
    for i = 0, 79 do
        if ReadShort(donald_party_stat + 0x54 + 0x2 * i) == 0x81A1 then
            WriteShort(donald_party_stat + 0x54 + 0x2 * i, 0x01A1)
        end
        if ReadShort(goofy_party_stat + 0x54 + 0x2 * i) == 0x81A1 then
            WriteShort(goofy_party_stat + 0x54 + 0x2 * i, 0x01A1)
        end
        if ReadShort(auron_party_stat + 0x54 + 0x2 * i) == 0x81A1 then
            WriteShort(auron_party_stat + 0x54 + 0x2 * i, 0x01A1)
        end
        if ReadShort(mulan_party_stat + 0x54 + 0x2 * i) == 0x81A1 then
            WriteShort(mulan_party_stat + 0x54 + 0x2 * i, 0x01A1)
        end
        if ReadShort(aladdin_party_stat + 0x54 + 0x2 * i) == 0x81A1 then
            WriteShort(aladdin_party_stat + 0x54 + 0x2 * i, 0x01A1)
        end
        if ReadShort(jack_sparrow_party_stat + 0x54 + 0x2 * i) == 0x81A1 then
            WriteShort(jack_sparrow_party_stat + 0x54 + 0x2 * i, 0x01A1)
        end
        if ReadShort(beast_party_stat + 0x54 + 0x2 * i) == 0x81A1 then
            WriteShort(beast_party_stat + 0x54 + 0x2 * i, 0x01A1)
        end
        if ReadShort(jack_skellington_party_stat + 0x54 + 0x2 * i) == 0x81A1 then
            WriteShort(jack_skellington_party_stat + 0x54 + 0x2 * i, 0x01A1)
        end
        if ReadShort(simba_party_stat + 0x54 + 0x2 * i) == 0x81A1 then
            WriteShort(simba_party_stat + 0x54 + 0x2 * i, 0x01A1)
        end
        if ReadShort(tron_party_stat + 0x54 + 0x2 * i) == 0x81A1 then
            WriteShort(tron_party_stat + 0x54 + 0x2 * i, 0x01A1)
        end
        if ReadShort(riku_party_stat + 0x54 + 0x2 * i) == 0x81A1 then
            WriteShort(riku_party_stat + 0x54 + 0x2 * i, 0x01A1)
        end
    end
end

function toggle_ability_limit()
    if is_ability_limit then
        if not is_code_printed then
            is_ability_limit = false
            is_code_printed = true
            ConsolePrint("Ability limit disabled")
        end
    else
        if not is_code_printed then
            is_ability_limit = true
            is_code_printed = true
            ConsolePrint("Ability limit enabled")
        end
    end
end

function apply_ability_limit()
    ability_count = 0
    for i = 0, 160, 2 do
        current_ability = ReadShort(sora_party_stat + 0x54 + i)
        if current_ability > 0x8000 then
            ability_count = ability_count + 1
        end
        if ability_count > 30 and current_ability > 0x8000 then
        WriteShort(sora_party_stat + 0x54 + i, current_ability - 0x8000)
        end
    end
end

function print_ability()
    if not is_ability_printed then
        is_ability_printed = true
        if ReadShort(input) == R3_L1 then
            ability_count = 0
            for i = 0, 160, 2 do
                current_ability = ReadShort(sora_party_stat + 0x54 + i)
                if current_ability > 0x8000 then
                    ability_count = ability_count + 1
                end
            end
            ConsolePrint(ability_count)
        end
    end
end

function print_and_toggle_code(string, state)
    if not is_code_printed then
        is_code_printed = true
        ConsolePrint(string)
    end
end

function toggle_no_rc()
    if is_no_rc then
        if not is_code_printed then
            is_no_rc = false
            is_code_printed = true
            ConsolePrint("No reaction command disabled")
        end
    else
        if not is_code_printed then 
            is_no_rc = true
            is_code_printed = true
            ConsolePrint("No reaction command enabled")
        end
    end
end

function apply_no_rc()
    for i = 0, 79 do 
        if ReadShort(riku_party_stat + 0x54 + 0x2 * i) == 0x81B6 then
            WriteShort(riku_party_stat + 0x54 + 0x2 * i, 0x01B6)
        end
        if ReadShort(riku_party_stat + 0x54 + 0x2 * i) == 0x81B4 then
            WriteShort(riku_party_stat + 0x54 + 0x2 * i, 0x01B4)
        end
    end
end

function toggle_full_ability()
    if is_full_ability then
        if not is_code_printed then
            is_code_printed = true
            is_full_ability = false
            ap = ReadByte(sora_party_stat + 0x8)
            WriteByte(sora_party_stat + 0x8, ap - 13)
            WriteShort(sora_party_stat + 0xEA, 0x0000)
            WriteShort(sora_party_stat + 0xEC, 0x0000)
            WriteShort(sora_party_stat + 0xEE, 0x0000)
            WriteShort(sora_party_stat + 0xF0, 0x0000)
            WriteShort(sora_party_stat + 0xF2, 0x0000)
            ConsolePrint("full movement ability disabled (go into the menu or change room to apply changes)")
        end 
    else
        if not is_code_printed then
            is_code_printed = true
            is_full_ability = true
            ap = ReadByte(sora_party_stat + 0x8)
            WriteByte(sora_party_stat + 0x8, ap + 13)
            WriteShort(sora_party_stat + 0xEA, 0x8060)
            WriteShort(sora_party_stat + 0xEC, 0x8064)
            WriteShort(sora_party_stat + 0xEE, 0x8236)
            WriteShort(sora_party_stat + 0xF0, 0x8068)
            WriteShort(sora_party_stat + 0xF2, 0x806C)
            ConsolePrint("full movement ability enabled (go into the menu or change room to apply changes)")
        end
    end
end
