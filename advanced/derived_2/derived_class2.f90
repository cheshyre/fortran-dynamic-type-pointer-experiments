module derived_class_2_module
    use, intrinsic :: iso_c_binding, only : c_loc

    use :: abc_module, only : abstract_base_class
    use :: wrapped_abc_module, only : wrapped_abstract_base_class
    use :: abc_cptr_module, only : abstract_base_class_c_wrapper

    implicit none

    private

    public :: derived_class_2

    ! public :: create_derived_class_2_instance
    ! public :: delete_derived_class_2_instance

    type, extends(abstract_base_class) :: derived_class_2
    contains
        procedure :: print_me => print_me_derived_2
    end type derived_class_2

    ! interface create_derived_class_2_instance
    !     module procedure create_derived_class_2_instance
    ! end interface create_derived_class_2_instance

    ! interface delete_derived_class_2_instance
    !     module procedure delete_derived_class_2_instance
    ! end interface delete_derived_class_2_instance

contains
    subroutine print_me_derived_2(this)
        class(derived_class_2), intent(in) :: this

        write(*,*) "PRINT_ME from DERIVED_CLASS_2"
    end subroutine print_me_derived_2

end module derived_class_2_module
