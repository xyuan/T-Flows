!==============================================================================!
  subroutine Swap_Short(a, b)
!------------------------------------------------------------------------------!
!   Swaps two short integers                                                   !
!------------------------------------------------------------------------------!
  implicit none
!---------------------------------[Arguments]----------------------------------!
  integer(kind=4) :: a, b
!-----------------------------------[Locals]-----------------------------------!
  integer(kind=4) :: t
!==============================================================================!

  t = a
  a = b
  b = t

  end subroutine
