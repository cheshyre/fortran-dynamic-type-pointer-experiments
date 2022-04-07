module abc_module
    implicit none

    private

    public :: abstract_base_class

    type, abstract :: abstract_base_class
    contains
        procedure(print_interface), deferred :: print_me
    end type abstract_base_class

    abstract interface
        subroutine print_interface(this)
            import :: abstract_base_class

            class(abstract_base_class), intent(in) :: this
        end subroutine print_interface
    end interface
contains
end module abc_module
