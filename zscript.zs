// HD's main ZScript lump.

version "4.3"

const HDCONST_TAU = 6.2831853;
const HDCONST_SQRTTWO = 1.41421356;
const HDCONST_ONEOVERSQRTTWO = 0.70710678;

const HDCONST_ONEMETRE = 42;
const HDCONST_MPSTODUPS = HDCONST_ONEMETRE*1./35;
const HDCONST_MINDISTANTSOUND = 128;
const HDCONST_SPEEDOFSOUND = 350*HDCONST_MPSTODUPS;

const SXF_ABSOLUTE=SXF_NOCHECKPOSITION|SXF_ABSOLUTEANGLE|SXF_ABSOLUTEPOSITION;

const HDCONST_426MAGMSG = "Reloading a 4.26 UAC Standard magazine into another firearm without authorization is a breach of the Volt End User License Agreement.";

//for calculating where the gun is on a body
const HDCONST_CROWNTOEYES=6.;
const HDCONST_CROWNTOSHOULDER=10.;
const HDCONST_SHOULDERTORADIUS=10.;
const HDCONST_MINEYERANGE=18.;


#include "zscript/function.zs"

#include "zscript/wep/weapon.zs"

#include "zscript/commands.zs"

#include "zscript/statusbar.zs"
#include "zscript/statusweapons.zs"
#include "zscript/crosshair.zs"

#include "zscript/fire.zs"
#include "zscript/effect.zs"
#include "zscript/bullet.zs"
#include "zscript/slowprojectile.zs"
#include "zscript/doorbuster.zs"

#include "zscript/player/player.zs"
#include "zscript/player/skins.zs"
#include "zscript/player/turn.zs"
#include "zscript/player/extras.zs"
#include "zscript/player/move.zs"
#include "zscript/player/heart.zs"
#include "zscript/player/damage.zs"
#include "zscript/player/lives.zs"
#include "zscript/player/crawl.zs"
#include "zscript/player/death.zs"
#include "zscript/player/respawn.zs"
#include "zscript/player/invhandling.zs"
#include "zscript/player/encumbrance.zs"
#include "zscript/player/loadout.zs"
#include "zscript/player/cheat.zs"

#include "zscript/tips.zs"

#include "zscript/flagpole.zs"

#include "zscript/pickup.zs"
#include "zscript/miscpickups.zs"
#include "zscript/magammo.zs"

#include "zscript/explosion.zs"
#include "zscript/fireball.zs"

#include "zscript/medikit.zs"
#include "zscript/injectors.zs"
#include "zscript/bloodpack.zs"

#include "zscript/armour.zs"
#include "zscript/gadgets.zs"
#include "zscript/ied.zs"
#include "zscript/ladder.zs"
#include "zscript/backpack.zs"
#include "zscript/blursphere.zs"
#include "zscript/spiritualarmour.zs"

#include "zscript/9ammo.zs"
#include "zscript/12ammo.zs"
#include "zscript/426ammo.zs"
#include "zscript/776ammo.zs"
#include "zscript/cellammo.zs"
#include "zscript/magmanager.zs"

//these must be arranged bulkiest to lightest
#include "zscript/wep/bfg.zs"
#include "zscript/wep/vulcanette.zs"
#include "zscript/wep/rocketlauncher.zs"
#include "zscript/wep/rocket.zs"
#include "zscript/wep/bossrifle.zs"
#include "zscript/wep/thunderbuster.zs"
#include "zscript/wep/liberator.zs"
#include "zscript/wep/brontornis.zs"
#include "zscript/wep/shotguns.zs"
#include "zscript/wep/hunter.zs"
#include "zscript/wep/slayer.zs"
#include "zscript/wep/chainsaw.zs"
#include "zscript/wep/zm66.zs"
#include "zscript/wep/smg.zs"
#include "zscript/wep/revolver.zs"
#include "zscript/wep/pistol.zs"
#include "zscript/wep/fist.zs"


#include "zscript/wep/tripwires.zs"
#include "zscript/wep/grenade.zs"

#include "zscript/derp.zs"
#include "zscript/herp.zs"
#include "zscript/chunkflick.zs"


#include "zscript/mon/mob.zs"
#include "zscript/mon/mobdamage.zs"

#include "zscript/mon/barrel.zs"
#include "zscript/mon/putto.zs"
#include "zscript/mon/yokai.zs"

#include "zscript/mon/marine.zs"
#include "zscript/mon/zombieman.zs"
#include "zscript/mon/shotgunguy.zs"
#include "zscript/mon/machinegunguy.zs"
#include "zscript/mon/nazi.zs"
#include "zscript/mon/pistolguy.zs"

#include "zscript/mon/serpentipede.zs"
#include "zscript/mon/babuin.zs"
#include "zscript/mon/spectre.zs"
#include "zscript/mon/trilobite.zs"
#include "zscript/mon/flyingskull.zs"
#include "zscript/mon/painlord.zs"

#include "zscript/mon/painbringer.zs"
#include "zscript/mon/boner.zs"
#include "zscript/mon/combatslug.zs"
#include "zscript/mon/technospider.zs"
#include "zscript/mon/necromancer.zs"

#include "zscript/mon/tripod.zs"
#include "zscript/mon/technorantula.zs"
#include "zscript/mon/bossbrain.zs"
#include "zscript/mon/stealthmonsters.zs"


#include "zscript/decorations.zs"

#include "zscript/range.zs"

#include "zscript/menu.zs"


