module derived_class_module
    implicit none
    private

    public :: base_class
    public :: derived_class
    public :: wrapped_base_class

    type :: base_class
    contains
        procedure :: print_me => base_print_me
    end type base_class

    type, extends(base_class) :: derived_class
    contains
        procedure :: print_me => derived_print_me
    end type derived_class

    type :: wrapped_base_class
        class(base_class), pointer :: ptr
    end type wrapped_base_class
contains
    subroutine base_print_me(this)
        class(base_class), intent(in) :: this

        write(*,*) "I'm the base class!"
    end subroutine base_print_me

    subroutine derived_print_me(this)
        class(derived_class), intent(in) :: this

        write(*,*) "I'm the derived class!"
    end subroutine derived_print_me
end module derived_class_module

program example
    use, intrinsic :: iso_c_binding, only : &
            c_loc, c_ptr, c_f_pointer
    use :: derived_class_module

    implicit none

    type(derived_class), target :: derived
    class(base_class), pointer :: ptr
    type(base_class), pointer :: tptr
    type(wrapped_base_class), target :: wrapped
    type(wrapped_base_class), pointer :: wrapped_ptr
    type(c_ptr) :: cptr

    write(*,*) "Calling print_me on derived type."
    call derived%print_me()

    ! Does not compile, ptr can not be polymorphic
    !cptr = c_loc(derived)
    !call c_f_pointer(cptr, ptr)
    !write(*,*) "Calling print_me on base class pointer."
    !call ptr%print_me()

    cptr = c_loc(derived)
    call c_f_pointer(cptr, tptr)
    write(*,*) "Calling print_me on base type pointer."
    call tptr%print_me()

    ! Trick - store polymorphic pointer in wrapper type
    wrapped%ptr => derived
    write(*,*) "Calling print_me on base class pointer."
    call wrapped%ptr%print_me()

    cptr = c_loc(wrapped)
    call c_f_pointer(cptr, wrapped_ptr)
    write(*,*) "Calling print_me on wrapped class pointer after c_loc and c_f_pointer."
    call wrapped_ptr%ptr%print_me()

end program example
