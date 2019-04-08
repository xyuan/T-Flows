!==============================================================================!
  module Save_Results_Mod
!------------------------------------------------------------------------------!
!   Module containig functions for saving numerical results for visualization. !
!   It comes in two flavors: "Vtu" and "Cgns", depending on the file format    !
!   one wants to save.  It has (and uses) a sister module "Save_Grid_Mod",     !
!   which is in the directory "Shared".                                        !
!------------------------------------------------------------------------------!
!----------------------------------[Modules]-----------------------------------!
  use Comm_Mod
  use Name_Mod
  use Grid_Mod,      only: Grid_Type
  use Save_Grid_Mod
  use Turb_Mod
  use Swarm_Mod,     only: Particle_Type, Swarm_Type
!------------------------------------------------------------------------------!
  implicit none
!==============================================================================!

  contains

  include 'Save_Results_Mod/Vtu/Save_Results.f90'
  include 'Save_Results_Mod/Vtu/Save_Scalar.f90'
  include 'Save_Results_Mod/Vtu/Save_Swarm.f90'
  include 'Save_Results_Mod/Vtu/Save_Vector.f90'

  end module 