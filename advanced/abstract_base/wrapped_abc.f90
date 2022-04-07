module wrapped_abc_module
    use :: abc_module, only : abstract_base_class

    implicit none
    
    private
    
    public :: wrapped_abstract_base_class

    type :: wrapped_abstract_base_class
        class(abstract_base_class), pointer :: ptr
    end type wrapped_abstract_base_class

contains
end module wrapped_abc_module
