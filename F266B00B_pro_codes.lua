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

is_full_ability = false

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
    if (GAME_ID == 0xF266B00B or GAME_ID == 0xFAF99301) and ENGINE_TYPE == "ENGINE" then --PCSX2
        ConsolePrint("PS2 version detected")
        input = 0x2034D4DC
        battle_state_address = 0x21C61958 --pas sur
        cursor2 = 0x21C5F878
        pause_status_address = 0x0347E08
        is_controllable_address = 0x1D48DB8
        sora_unit_stat = 0x1C6C750
        party1_unit_stat = 0x1C6C4E8
        party2_unit_stat = 0x1C6C280
        sora_level_stat = 0x1D0B6A8
        donald_level_stat = 0x1D0BCDC
        goofy_level_stat = 0x1D0C310
        mickey_level_stat = 0x1D0C944
        auron_level_stat = 0x1D0CF78
        mulan_level_stat = 0x1D0D5AC
        aladdin_level_stat = 0x1D0DBE0
        jack_sparrow_level_stat = 0x1D0E214
        beast_level_stat = 0x1D0E848
        jack_skellington_level_stat = 0x1D0EE7C
        simba_level_stat = 0x1D0F4B0
        tron_level_stat = 0x1D0FAE4
        riku_level_stat = 0x1D10118
        sora_party_stat = 0x032E020
        donald_party_stat = 0x032E134
        goofy_party_stat = 0x032E248
        mickey_party_stat = 0x032E35C
        auron_party_stat = 0x032E470
        mulan_party_stat = 0x032E584
        aladdin_party_stat = 0x032E698
        jack_sparrow_party_stat = 0x032E7AC
        beast_party_stat = 0x032E8C0
        jack_skellington_party_stat = 0x032E9D4
        simba_party_stat = 0x032EAE8
        tron_party_stat = 0x032EBFC
        riku_party_stat = 0x032ED10
        valor_cost = 0x1CCB6E0
        wisdom_cost = 0x1CCB710
        limit_cost = 0x1CD2D30
        master_cost = 0x1CCB7A0
        final_cost = 0x1CCB7D0
        auto_valor_cost = 0x1CD1740
        auto_wisdom_cost = 0x1CD1770
        auto_limit_cost = 0x1CD2D60
        auto_master_cost = 0x1CD17A0
        auto_final_cost = 0x1CD17D0
        chiken_little_cost = 0x1CD0480
        genie_cost = 0x1CCC370
        stitch_cost = 0x1CCC3A0
        peter_pan_cost = 0x1CCEAA0
        sora_cure = 0x032F0C7
        cure1_flag = 0x032D861
        cure2_flag = 0x032D849
        cure3_flag = 0x032D850
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
        ConsolePrint("PC version detected")
        offset = 0x56454E
        input = 0x711488 - offset
        battle_state_address = 0x2A0EB04 - offset
        cursor2 = 0x2A0E0BC - offset
        pause_status_address = 0x0AB9038 + 0x40 - offset
        is_controllable_address = 0x2A148A8 + 0x40 - offset
        sora_unit_stat = 0x2A20C58 + 0x40 - offset
        party1_unit_stat = 0x2A209E0 + 0x40 - offset
        party2_unit_stat = 0x2A20768 + 0x40 - offset
        sora_level_stat = 0x2A9A168 + 0x40 - offset
        donald_level_stat = 0x2A9A79C + 0x40 - offset
        goofy_level_stat = 0x2A9ADD0 + 0x40 - offset
        mickey_level_stat = 0x2A9B404 + 0x40 - offset
        auron_level_stat = 0x2A9BA38 + 0x40 -offset
        mulan_level_stat = 0x2A9C06C + 0x40 - offset
        aladdin_level_stat = 0x2A9C6A0 + 0x40 - offset
        jack_sparrow_level_stat = 0x2A9CCD4 + 0x40 - offset
        beast_level_stat = 0x2A9D308 + 0x40 - offset
        jack_skellington_level_stat = 0x2A9D93C + 0x40 - offset
        simba_level_stat = 0x2A9DF70 + 0x40 - offset
        tron_level_stat = 0x2A9E5A4 + 0x40 - offset
        riku_level_stat = 0x2A9EBD8 + 0x40 - offset
        sora_party_stat = 0x09A9560 + 0x40 - offset
        donald_party_stat = 0x09A9674 + 0x40 - offset
        goofy_party_stat = 0x09A9788 + 0x40 - offset
        mickey_party_stat = 0x09A989C + 0x40 - offset
        auron_party_stat = 0x09A99B0 + 0x40 - offset
        mulan_party_stat = 0x09A9AC4 + 0x40 - offset
        aladdin_party_stat = 0x09A9BD8 + 0x40 - offset
        jack_sparrow_party_stat = 0x09A9CEC + 0x40 - offset
        beast_party_stat = 0x09A9E00 + 0x40 - offset
        jack_skellington_party_stat = 0x09A9F14 + 0x40 - offset
        simba_party_stat = 0x09AA028 + 0x40 - offset
        tron_party_stat = 0x09AA13C + 0x40 - offset
        riku_party_stat = 0x09AA250 + 0x40 - offset
        valor_cost = 0x2A5A190 + 0x40 - offset
        wisdom_cost = 0x2A5A1C0 + 0x40 - offset
        limit_cost = 0x2A617E0 + 0x40 - offset
        master_cost = 0x2A5A250 + 0x40 - offset
        final_cost = 0x2A5A280 + 0x40 - offset
        auto_valor_cost = 0x2A601F0 + 0x40 - offset
        auto_wisdom_cost = 0x2A60220 + 0x40 - offset
        auto_limit_cost = 0x2A61810 + 0x40 - offset
        auto_master_cost = 0x2A60250 + 0x40 - offset
        auto_final_cost = 0x2A60280 + 0x40 - offset
        chiken_little_cost = 0x2A5EF30 + 0x40 - offset
        genie_cost = 0x2A5AE20 + 0x40 - offset
        stitch_cost = 0x2A5AE50 + 0x40 - offset
        peter_pan_cost = 0x2A5D550 + 0x40 - offset
        sora_cure = 0x09AA607 + 0x40 - offset
        cure1_flag = 0x09A8DA1 +0x40 - offset
        cure2_flag = 0x09A8D89 + 0x40 - offset
        cure3_flag = 0x09A8D90 + 0x40 -offset
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

function _OnFrame()
    if has_to_init == true and frame == 110 then
        if ReadInt(sora_level_stat) > 40 then
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
            characters_level_stat[1][i + 1][3] = ReadByte(sora_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level_stat[2][i + 1][3] = ReadByte(donald_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level_stat[3][i + 1][3] = ReadByte(goofy_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level_stat[4][i + 1][3] = ReadByte(mickey_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level_stat[5][i + 1][3] = ReadByte(auron_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level_stat[6][i + 1][3] = ReadByte(mulan_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level_stat[7][i + 1][3] = ReadByte(aladdin_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level_stat[8][i + 1][3] = ReadByte(jack_sparrow_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level_stat[9][i + 1][3] = ReadByte(beast_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level_stat[10][i + 1][3] = ReadByte(jack_skellington_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level_stat[11][i + 1][3] = ReadByte(simba_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level_stat[12][i + 1][3] = ReadByte(tron_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level_stat[13][i + 1][3] = ReadByte(riku_level_stat + 0x6 + 0x10*i + rando_offset)

        end
        WriteByte(sora_level_stat + 0x6 + 0x10*i + rando_offset, 0)
        WriteByte(donald_level_stat + 0x6 + 0x10*i + rando_offset, 0)
        WriteByte(goofy_level_stat + 0x6 + 0x10*i + rando_offset, 0)
        WriteByte(mickey_level_stat + 0x6 + 0x10*i + rando_offset, 0)
        WriteByte(auron_level_stat + 0x6 + 0x10*i + rando_offset, 0)
        WriteByte(mulan_level_stat + 0x6 + 0x10*i + rando_offset, 0)
        WriteByte(aladdin_level_stat + 0x6 + 0x10*i + rando_offset, 0)
        WriteByte(jack_sparrow_level_stat + 0x6 + 0x10*i + rando_offset, 0)
        WriteByte(beast_level_stat + 0x6 + 0x10*i + rando_offset, 0)
        WriteByte(jack_skellington_level_stat + 0x6 + 0x10*i + rando_offset, 0)
        WriteByte(simba_level_stat + 0x6 + 0x10*i + rando_offset, 0)
        WriteByte(tron_level_stat + 0x6 + 0x10*i + rando_offset, 0)
        WriteByte(riku_level_stat + 0x6 + 0x10*i + rando_offset, 0)
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
            characters_level_stat[1][i + 1][1] = ReadByte(sora_level_stat + 0x4 + 0x10*i + rando_offset)
            characters_level_stat[1][i + 1][2] = ReadByte(sora_level_stat + 0x5 + 0x10*i + rando_offset)
            characters_level_stat[2][i + 1][1] = ReadByte(donald_level_stat + 0x4 + 0x10*i + rando_offset)
            characters_level_stat[2][i + 1][2] = ReadByte(donald_level_stat + 0x5 + 0x10*i + rando_offset)
            characters_level_stat[3][i + 1][1] = ReadByte(goofy_level_stat + 0x4 + 0x10*i + rando_offset)
            characters_level_stat[3][i + 1][2] = ReadByte(goofy_level_stat + 0x5 + 0x10*i + rando_offset)
            characters_level_stat[4][i + 1][1] = ReadByte(mickey_level_stat + 0x4 + 0x10*i + rando_offset)
            characters_level_stat[4][i + 1][2] = ReadByte(mickey_level_stat + 0x5 + 0x10*i + rando_offset)
            characters_level_stat[5][i + 1][1] = ReadByte(auron_level_stat + 0x4 + 0x10*i + rando_offset)
            characters_level_stat[5][i + 1][2] = ReadByte(auron_level_stat + 0x5 + 0x10*i + rando_offset)
            characters_level_stat[6][i + 1][1] = ReadByte(mulan_level_stat + 0x4 + 0x10*i + rando_offset)
            characters_level_stat[6][i + 1][2] = ReadByte(mulan_level_stat + 0x5 + 0x10*i + rando_offset)
            characters_level_stat[7][i + 1][1] = ReadByte(aladdin_level_stat + 0x4 + 0x10*i + rando_offset)
            characters_level_stat[7][i + 1][2] = ReadByte(aladdin_level_stat + 0x5 + 0x10*i + rando_offset)
            characters_level_stat[8][i + 1][1] = ReadByte(jack_sparrow_level_stat + 0x4 + 0x10*i + rando_offset)
            characters_level_stat[8][i + 1][2] = ReadByte(jack_sparrow_level_stat + 0x5 + 0x10*i + rando_offset)
            characters_level_stat[9][i + 1][1] = ReadByte(beast_level_stat + 0x4 + 0x10*i + rando_offset)
            characters_level_stat[9][i + 1][2] = ReadByte(beast_level_stat + 0x5 + 0x10*i + rando_offset)
            characters_level_stat[10][i + 1][1] = ReadByte(jack_skellington_level_stat + 0x4 + 0x10*i + rando_offset)
            characters_level_stat[10][i + 1][2] = ReadByte(jack_skellington_level_stat + 0x5 + 0x10*i + rando_offset)
            characters_level_stat[11][i + 1][1] = ReadByte(simba_level_stat + 0x4 + 0x10*i + rando_offset)
            characters_level_stat[11][i + 1][2] = ReadByte(simba_level_stat + 0x5 + 0x10*i + rando_offset)
            characters_level_stat[12][i + 1][1] = ReadByte(tron_level_stat + 0x4 + 0x10*i + rando_offset)
            characters_level_stat[12][i + 1][2] = ReadByte(tron_level_stat + 0x5 + 0x10*i + rando_offset)
            characters_level_stat[13][i + 1][1] = ReadByte(riku_level_stat + 0x4 + 0x10*i + rando_offset)
            characters_level_stat[13][i + 1][2] = ReadByte(riku_level_stat + 0x5 + 0x10*i + rando_offset)
        end
        if characters_level_stat[1][i + 1][3] == nil then
            characters_level[1][i + 1][3] = ReadByte(sora_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level[2][i + 1][3] = ReadByte(donald_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level[3][i + 1][3] = ReadByte(goofy_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level[4][i + 1][3] = ReadByte(mickey_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level[5][i + 1][3] = ReadByte(auron_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level[6][i + 1][3] = ReadByte(mulan_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level[7][i + 1][3] = ReadByte(aladdin_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level[8][i + 1][3] = ReadByte(jack_sparrow_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level[9][i + 1][3] = ReadByte(beast_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level[10][i + 1][3] = ReadByte(jack_skellington_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level[11][i + 1][3] = ReadByte(simba_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level[12][i + 1][3] = ReadByte(tron_level_stat + 0x6 + 0x10*i + rando_offset)
            characters_level[13][i + 1][3] = ReadByte(riku_level_stat + 0x6 + 0x10*i + rando_offset)

        end
        WriteByte(sora_level_stat + 0x4 + 0x10*i + rando_offset, 2)
        WriteByte(sora_level_stat + 0x5 + 0x10*i + rando_offset, 6)
        WriteByte(donald_level_stat + 0x4 + 0x10*i + rando_offset, 1)
        WriteByte(donald_level_stat + 0x5 + 0x10*i + rando_offset, 5)
        WriteByte(goofy_level_stat + 0x4 + 0x10*i + rando_offset, 5)
        WriteByte(goofy_level_stat + 0x5 + 0x10*i + rando_offset, 0)
        WriteByte(mickey_level_stat + 0x4 + 0x10*i + rando_offset, 4)
        WriteByte(mickey_level_stat + 0x5 + 0x10*i + rando_offset, 7)
        WriteByte(auron_level_stat + 0x4 + 0x10*i + rando_offset, 4)
        WriteByte(auron_level_stat + 0x5 + 0x10*i + rando_offset, 0)
        WriteByte(mulan_level_stat + 0x4 + 0x10*i + rando_offset, 4)
        WriteByte(mulan_level_stat + 0x5 + 0x10*i + rando_offset, 7)
        WriteByte(aladdin_level_stat + 0x4 + 0x10*i + rando_offset, 4)
        WriteByte(aladdin_level_stat + 0x5 + 0x10*i + rando_offset, 0)
        WriteByte(jack_sparrow_level_stat + 0x4 + 0x10*i + rando_offset, 4)
        WriteByte(jack_sparrow_level_stat + 0x5 + 0x10*i + rando_offset, 0)
        WriteByte(beast_level_stat + 0x4 + 0x10*i + rando_offset, 4)
        WriteByte(beast_level_stat + 0x5 + 0x10*i + rando_offset, 0)
        WriteByte(jack_skellington_level_stat + 0x4 + 0x10*i + rando_offset, 4)
        WriteByte(jack_skellington_level_stat + 0x5 + 0x10*i + rando_offset, 7)
        WriteByte(simba_level_stat + 0x4 + 0x10*i + rando_offset, 4)
        WriteByte(simba_level_stat + 0x5 + 0x10*i + rando_offset, 7)
        WriteByte(tron_level_stat + 0x4 + 0x10*i + rando_offset, 4)
        WriteByte(tron_level_stat + 0x5 + 0x10*i + rando_offset, 7)
        WriteByte(riku_level_stat + 0x4 + 0x10*i + rando_offset, 4)
        WriteByte(riku_level_stat + 0x5 + 0x10*i + rando_offset, 7)
        if not is_zero_defense then
            WriteByte(sora_level_stat + 0x6 + 0x10*i + rando_offset, 2)
            WriteByte(donald_level_stat + 0x6 + 0x10*i + rando_offset, 2)
            WriteByte(goofy_level_stat + 0x6 + 0x10*i + rando_offset, 2)
            WriteByte(mickey_level_stat + 0x6 + 0x10*i + rando_offset, 4)
            WriteByte(auron_level_stat + 0x6 + 0x10*i + rando_offset, 5)
            WriteByte(mulan_level_stat + 0x6 + 0x10*i + rando_offset, 5)
            WriteByte(aladdin_level_stat + 0x6 + 0x10*i + rando_offset, 5)
            WriteByte(jack_sparrow_level_stat + 0x6 + 0x10*i + rando_offset, 5)
            WriteByte(beast_level_stat + 0x6 + 0x10*i + rando_offset, 5)
            WriteByte(jack_skellington_level_stat + 0x6 + 0x10*i + rando_offset, 4)
            WriteByte(simba_level_stat + 0x6 + 0x10*i + rando_offset, 4)
            WriteByte(tron_level_stat + 0x6 + 0x10*i + rando_offset, 4)
            WriteByte(riku_level_stat + 0x6 + 0x10*i + rando_offset, 4)
        end
    end
end

function update_level_stats()
    if (not is_zero_defense) and (not (characters_level_stat[1][1][3] == nil)) then
        for i = 0, 98 do
            WriteByte(sora_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[1][i + 1][3])
            WriteByte(donald_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[2][i + 1][3])
            WriteByte(goofy_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[3][i + 1][3])
            WriteByte(mickey_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[4][i + 1][3])
            WriteByte(auron_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[5][i + 1][3])
            WriteByte(mulan_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[6][i + 1][3])
            WriteByte(aladdin_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[7][i + 1][3])
            WriteByte(jack_sparrow_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[8][i + 1][3])
            WriteByte(beast_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[9][i + 1][3])
            WriteByte(jack_skellington_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[10][i + 1][3])
            WriteByte(simba_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[11][i + 1][3])
            WriteByte(tron_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[12][i + 1][3])
            WriteByte(riku_level_stat + 0x6 + 0x10*i + rando_offset, characters_level_stat[13][i + 1][3])
        end
    end
    if (not is_default_status) and (not (characters_level_stat[1][1][1] == nil)) then
        for i = 0, 98 do
            WriteByte(sora_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[1][i + 1][1])
            WriteByte(sora_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[1][i + 1][2])
            WriteByte(donald_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[2][i + 1][1])
            WriteByte(donald_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[2][i + 1][2])
            WriteByte(goofy_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[3][i + 1][1])
            WriteByte(goofy_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[3][i + 1][2])
            WriteByte(mickey_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[4][i + 1][1])
            WriteByte(mickey_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[4][i + 1][2])
            WriteByte(auron_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[5][i + 1][1])
            WriteByte(auron_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[5][i + 1][2])
            WriteByte(mulan_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[6][i + 1][1])
            WriteByte(mulan_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[6][i + 1][2])
            WriteByte(aladdin_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[7][i + 1][1])
            WriteByte(aladdin_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[7][i + 1][2])
            WriteByte(jack_sparrow_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[8][i + 1][1])
            WriteByte(jack_sparrow_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[8][i + 1][2])
            WriteByte(beast_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[9][i + 1][1])
            WriteByte(beast_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[9][i + 1][2])
            WriteByte(jack_skellington_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[10][i + 1][1])
            WriteByte(jack_skellington_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[10][i + 1][2])
            WriteByte(simba_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[11][i + 1][1])
            WriteByte(simba_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[11][i + 1][2])
            WriteByte(tron_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[12][i + 1][1])
            WriteByte(tron_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[12][i + 1][2])
            WriteByte(riku_level_stat + 0x4 + 0x10*i + rando_offset, characters_level_stat[13][i + 1][1])
            WriteByte(riku_level_stat + 0x5 + 0x10*i + rando_offset, characters_level_stat[13][i + 1][2])
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
        drive_cost[1][1] = ReadByte(valor_cost + rando_offset)
        drive_cost[2][1] = ReadByte(auto_valor_cost + rando_offset)
        drive_cost[1][2] = ReadByte(wisdom_cost + rando_offset)
        drive_cost[2][2] = ReadByte(wisdom_cost + rando_offset)
        drive_cost[1][3] = ReadByte(limit_cost + rando_offset)
        drive_cost[2][3] = ReadByte(auto_limit_cost + rando_offset)
        drive_cost[1][4] = ReadByte(master_cost + rando_offset)
        drive_cost[2][4] = ReadByte(auto_master_cost + rando_offset)
        drive_cost[1][5] = ReadByte(final_cost + rando_offset)
        drive_cost[2][5] = ReadByte(auto_final_cost + rando_offset)
    end
        WriteByte(valor_cost + rando_offset, 10)
        WriteByte(auto_valor_cost + rando_offset, 10)
        WriteByte(wisdom_cost + rando_offset, 10)
        WriteByte(auto_wisdom_cost + rando_offset, 10)
        WriteByte(limit_cost + rando_offset, 10)
        WriteByte(auto_limit_cost + rando_offset, 10)
        WriteByte(master_cost + rando_offset, 10)
        WriteByte(auto_master_cost + rando_offset, 10)
        WriteByte(final_cost + rando_offset, 10)
        WriteByte(auto_final_cost + rando_offset, 10)
end

function remove_no_form()
    if not (drive_cost[1][1] == nil) then
        WriteByte(valor_cost + rando_offset, drive_cost[1][1])
        WriteByte(auto_valor_cost + rando_offset, drive_cost[2][1])
        WriteByte(wisdom_cost + rando_offset, drive_cost[1][2])
        WriteByte(auto_wisdom_cost + rando_offset, drive_cost[2][2])
        WriteByte(limit_cost + rando_offset, drive_cost[1][3])
        WriteByte(auto_limit_cost + rando_offset, drive_cost[2][3])
        WriteByte(master_cost + rando_offset, drive_cost[1][4])
        WriteByte(auto_master_cost + rando_offset, drive_cost[2][4])
        WriteByte(final_cost + rando_offset, drive_cost[1][5])
        WriteByte(auto_final_cost + rando_offset, drive_cost[2][5])
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
        summon_cost[1] = ReadByte(chiken_little_cost + rando_offset)
        summon_cost[2] = ReadByte(genie_cost + rando_offset)
        summon_cost[3] = ReadByte(stitch_cost + rando_offset)
        summon_cost[4] = ReadByte(peter_pan_cost + rando_offset)
    end
    WriteByte(chiken_little_cost + rando_offset, 10)
    WriteByte(genie_cost + rando_offset, 10)
    WriteByte(stitch_cost + rando_offset, 10)
    WriteByte(peter_pan_cost + rando_offset, 10)
end

function remove_no_summon()
    if not (summon_cost[1] == nil) then
        WriteByte(chiken_little_cost + rando_offset, summon_cost[1])
        WriteByte(genie_cost + rando_offset, summon_cost[2])
        WriteByte(stitch_cost + rando_offset, summon_cost[3])
        WriteByte(peter_pan_cost + rando_offset, summon_cost[4])
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