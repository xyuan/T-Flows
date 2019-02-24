!==============================================================================!
  subroutine User_Mod_End_Of_Time_Step(flow, swarm, n, time)
!------------------------------------------------------------------------------!
!   This function is called at the end of time step.                           !
!------------------------------------------------------------------------------!
  implicit none
!---------------------------------[Arguments]----------------------------------!
  type(Field_Type), target :: flow
  type(Swarm_Type), target :: swarm
  integer                  :: n     ! time step
  real                     :: time  ! physical time
!----------------------------------[Locals]------------------------------------!
  integer :: k
  real    :: dx
!==============================================================================!

  !-------------------!
  !   1st time step   !
  !-------------------!
  if (n .eq. 1201) then     ! should be after the flow is developed

    ! Initializing both deposition and departure counters
    swarm % cnt_d = 0
    swarm % cnt_e = 0
    swarm % cnt_r = 0

    ! Create the swarm
    call Swarm_Mod_Create(flow, swarm)

    ! Place the particles where you want them
    do k = 1, swarm % n_particles

      ! Placing particles (only at the 1st time step)
      dx = 20 * (k - 1)

      swarm % particle(k) % x = -0.00375 + dx * swarm % particle(k) % d
      swarm % particle(k) % y = 0.0599999
      swarm % particle(k) % z = 0.0

      ! Searching for the closest cell to place the moved particle
      call Swarm_Mod_Find_Nearest_Cell(swarm, k)
    end do

    print *, ""
    print *, "trapped particles =",swarm % cnt_d,  &
        ",","escaped particles =",swarm % cnt_e,       &
        ",","reflected particles =",swarm % cnt_r
  end if

  !----------------------!
  !   2nd time step on   !
  !----------------------!
  if (n .gt. 1201) then     ! should be after the flow is developed

    call Swarm_Mod_Advance_Particles(swarm)

    print *, ""
    print *, "trapped particles =",swarm % cnt_d,  &
         ",","escaped particles =",swarm % cnt_e,       &
         ",","reflected particles =",swarm % cnt_r

  end if

  end subroutine