module mod1
  implicit none
  integer :: i = 4

contains

  subroutine print_sthg
    print*, 'this is module 1, i=',i
  end subroutine
end module mod1
