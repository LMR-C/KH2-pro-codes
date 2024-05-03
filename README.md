<h1>Pro codes For KH2FM</h1>

<h2>Overview</h2>
<p>This mods aims to recreate the pro codes feature from KH3. As certain codes are not reproductible in KH2 this mod can be seen as an adaptation.<br/>
  The mod make the game really hard and I don't really know if it is possible to beat. I let super players give us the answer !<br/>
  The mod has not been fully tested so you may encounters some bugs. You can report me those on <a href = https://discord.gg/eXX8pM8pj9>Discord</a> <br/>
You'll find next to this the codes list and some quality of life features.</p>

<h2>Compatibility</h2>
<p>Pro codes works on both <code>PC</code> and <code>PCSX2-EX</code> and are fully compatible with the KH2 randomnizer ! Just place the 3 parts of the mod above your seed (don't forget to place forms levels on vanilla or junk during seed creation)</br>
I didn't test it with other mods but it should be compatible with any mod that don't modify those things:</p>
<ul>
  <li><B>03system.bin</B></li>
  <li><B>00battle.bin</B></li>
  <li><B>ennemies object</B></li>
  <li><B>mission's ARD</B></li>
</ul>

<h2>Installation</h2>
<p>To be able to toggle every pro code this mod come in 3 parts. Open your openKH mod manager and go to <code>Mods > Install a new mod</code>
and type : <code>LMR-C/KH2-pro-codes</code> and press <code>Install</code>. Repeat this step with <code>LMR-C/KH2-pro-codes-no-rc</code> and <code>LMR-C/KH2-pro-codes-no-mickey</code>. Then activate the mods and you're ready to go.<br/>
  <B>Note:</B> For <code>PCSX2-EX</code> for the mod to work, in the mod manager click on <code>pro codes</code> and go to <code>Mods > Open mod folder</code> then copy <code>F266B00B_pro_codes.lua</code>
 and paste it to the <code>scripts</code> folder of PCSX2.</p>

<h2>Pro codes list</h2>
<lu>
  <li><B>default status</B> : Your whole teams's stats are returned to their initial default status, regardless of level</li>
  <li><B>Hp slip</B> : During battle, your whole team's HP automatically decrease over time until it reaches dangerous levels</li>
  <li><B>Zero defense</B> : Your whole team's defense is set to 0. However, defense boost from equipment are still applied</li>
  <li><B>MP slip</B> : During battle, your whole team's MP automatically decrease over time, and MP recharge is doubled</li>
  <li><B>no battle items</B> : during battle, your whole team cannot use items</li>
  <li><B>no summon</B> : You cannot use summon</li>
  <li><B>no form</B> : you cannot use forms</li>
  <li><B>no cure</B> : your whole team cannot use cure magic</li>
  <li><B>no team attacks</B> : You cannot use limit</li>
  <li><B>ability limit</B> : A maximum limit of 30 is placed on abilities you can install on sora</li>
  <li><B>no mickey</B> : Mickey no more come to your rescue</li>
  <li><B>no reaction command</B> : most of reaction commands do not appear</li>
</lu>

<h2>How to toggle pro codes ?</h2>
<p>You can enabled/disable most of pro codes in game with input combination. Once you performed one a log is printed in the console to notify you the state of the code.<br/>
  Please hold buttons 1 for second to make it work correctly</br>
  To see the console:<br/>
<B>PC</B> : Press <code>F2</code><br/>
<B>PCSX2-EX</B> : (if the console doesn't show up) <code>Misc > Show Console</code></p>
<ul>
  <li><B>default status</B> : <code>L3 + ✕</code></li>
  <li><B>Hp slip</B> : <code>L3 + △</code></li>
  <li><B>Zero defense</B> : <code>L3 + ◯</code></li>
  <li><B>MP slip</B> : <code>L3 + ▢</code></li>
  <li><B>no battle items</B> : <code>L3 + R1</code></li>
  <li><B>no summon</B> : <code>L3 + L2</code></li>
  <li><B>no form</B> : <code>L3 + L1</code></li>
  <li><B>no cure</B> : <code>L3 + R2</code></li>
  <li><B>no team attacks</B> : <code>L3 + R3 + △</code></li>
  <li><B>ability limit</B> : <code>L3 + R3 + ◯</code></li>
  <li><B>no mickey</B> : disable the mod in the mod manager and restart the game</li>
  <li><B>no reaction command</B> : disable the mod in the mod manager, restart the game and when you're in game press:<code>L3&nbsp+&nbspR3&nbsp+&nbsp▢</code></li>
</ul>

<h2>Quality of life</h2>
<p>You can see the abilities you enabled for sora, because if you play with ability limit you need to stay below 30. You can also get all growth ability 
when you want.</p>
<ul>
  <li><B>Get all growth ability</B> : <code>R3 + R1</code></li>
  <li><B>ability equiped</B> : <code>R3 + L1</code></li>
</ul>

<h2>Troubleshootings</h2>
<p>The mod has not been tested that much but you should not encounters too much problems.
nevertheless if you see a bug please report it <a href = https://discord.gg/eXX8pM8pj9>here</a></p>
<h3>Known issues</h3>
<ul>
  <li><B>Get all growth ability</B> : All growth abilities quality of life needs to be reset between saves loads. <br/>
    i.e: if you die and want to load a save: disable it load and then enable it. If you already enabled it on the save you want to load just ignore that</li>
  <li><B>ability limit</B> : You can enable as much ability as you want but once you get out of the menu the mod will disable any ability after the 30th enabled (in the game memory order) so keep an eye on your number of equiped abilities
  with <code>R3&nbsp+&nbspL1</code></li>
  <li><B>no cure</B> : For randomnizer : no cure toggling works as intended only for the first save file. It won't works if
  you reboot the game and load a save. And if you changed of savefile during a playthrought you'll get back only the cure you earn in the first one.</li>
  <li><B>no reaction command</B> : seem to not work with HT armored knight and HB hook bat while playing with randomnizer</li>
</ul>
