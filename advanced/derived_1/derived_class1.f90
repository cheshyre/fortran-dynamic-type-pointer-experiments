module derived_class_1_module
    use, intrinsic :: iso_c_binding, only : c_loc

    use :: abc_module, only : abstract_base_class
    use :: wrapped_abc_module, only : wrapped_abstract_base_class
    use :: abc_cptr_module, only : abstract_base_class_c_wrapper

    implicit none

    private

    public :: derived_class_1

    ! public :: create_derived_class_1_instance
    ! public :: delete_derived_class_1_instance

    type, extends(abstract_base_class) :: derived_class_1
    contains
        procedure :: print_me => print_me_derived_1
    end type derived_class_1

    ! interface create_derived_class_1_instance
    !     module procedure create_derived_class_1_instance
    ! end interface create_derived_class_1_instance

    ! interface delete_derived_class_1_instance
    !     module procedure delete_derived_class_1_instance
    ! end interface delete_derived_class_1_instance

contains
    subroutine print_me_derived_1(this)
        class(derived_class_1), intent(in) :: this

        write(*,*) "PRINT_ME from DERIVED_CLASS_1"
    end subroutine print_me_derived_1

end module derived_class_1_module
