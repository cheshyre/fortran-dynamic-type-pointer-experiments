add_executable(example example.f90)
target_link_libraries(
    example
    PUBLIC
    -fsanitize=address
)
