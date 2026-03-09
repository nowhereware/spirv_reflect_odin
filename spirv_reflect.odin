package spirv_reflect

when ODIN_OS == .Windows {
	@(export)
	foreign import lib "spirv-reflect-static.lib"
} else {
	@(export)
	foreign import lib "spirv-reflect-static.a"
}

Result :: enum i32 {
	SUCCESS,
	NOT_READY,
	ERROR_PARSE_FAILED,
	ERROR_ALLOC_FAILED,
	ERROR_RANGE_EXCEEDED,
	ERROR_NULL_POINTER,
	ERROR_INTERNAL_ERROR,
	ERROR_COUNT_MISMATCH,
	ERROR_ELEMENT_NOT_FOUND,
	ERROR_SPIRV_INVALID_CODE_SIZE,
	ERROR_SPIRV_INVALID_MAGIC_NUMBER,
	ERROR_SPIRV_UNEXPECTED_EOF,
	ERROR_SPIRV_INVALID_ID_REFERENCE,
	ERROR_SPIRV_SET_NUMBER_OVERFLOW,
	ERROR_SPIRV_INVALID_STORAGE_CLASS,
	ERROR_SPIRV_RECURSION,
	ERROR_SPIRV_INVALID_INSTRUCTION,
	ERROR_SPIRV_UNEXPECTED_BLOCK_DATA,
	ERROR_SPIRV_INVALID_BLOCK_MEMBER_REFERENCE,
	ERROR_SPIRV_INVALID_ENTRY_POINT,
	ERROR_SPIRV_INVALID_EXECUTION_MODE,
	ERROR_SPIRV_MAX_RECURSIVE_EXCEEDED,
}

ModuleFlag :: enum u32 {
	NO_COPY = 1,
}
ModuleFlags :: bit_set[ModuleFlag;u32]

TypeFlag :: enum u32 {
	UNDEFINED                       = 0,
	VOID                            = 1,
	BOOL                            = 2,
	INT                             = 3,
	FLOAT                           = 4,
	VECTOR                          = 9,
	MATRIX                          = 10,
	EXTERNAL_IMAGE                  = 17,
	EXTERNAL_SAMPLER                = 18,
	EXTERNAL_SAMPLED_IMAGE          = 19,
	EXTERNAL_BLOCK                  = 20,
	EXTERNAL_ACCELERATION_STRUCTURE = 21,
	STRUCT                          = 29,
	ARRAY                           = 30,
	REF                             = 31,
}
TypeFlags :: bit_set[TypeFlag;u32]

DecorationFlag :: enum u32 {
	NONE                = 0,
	BLOCK               = 1,
	BUFFER_BLOCK        = 2,
	ROW_MAJOR           = 3,
	COLUMN_MAJOR        = 4,
	BUILT_IN            = 5,
	NOPERSPECTIVE       = 6,
	FLAT                = 7,
	NON_WRITABLE        = 8,
	RELAXED_PRECISION   = 9,
	NON_READABLE        = 10,
	PATCH               = 11,
	PER_VERTEX          = 12,
	PER_TASK            = 13,
	WEIGHT_TEXTURE      = 14,
	BLOCK_MATCH_TEXTURE = 15,
}
DecorationFlags :: bit_set[DecorationFlag;u32]

UserType :: enum i32 {
	INVALID = 0,
	CBUFFER,
	TBUFFER,
	APPEND_STRUCTURED_BUFFER,
	BUFFER,
	BYTE_ADDRESS_BUFFER,
	CONSTANT_BUFFER,
	CONSUME_STRUCTURED_BUFFER,
	INPUT_PATCH,
	OUTPUT_PATCH,
	RASTERIZER_ORDERED_BUFFER,
	RASTERIZER_ORDERED_BYTE_ADDRESS_BUFFER,
	RASTERIZER_ORDERED_STRUCTURED_BUFFER,
	RASTERIZER_ORDERED_TEXTURE_1D,
	RASTERIZER_ORDERED_TEXTURE_1D_ARRAY,
	RASTERIZER_ORDERED_TEXTURE_2D,
	RASTERIZER_ORDERED_TEXTURE_2D_ARRAY,
	RASTERIZER_ORDERED_TEXTURE_3D,
	RAYTRACING_ACCELERATION_STRUCTURE,
	RW_BUFFER,
	RW_BYTE_ADDRESS_BUFFER,
	RW_STRUCTURED_BUFFER,
	RW_TEXTURE_1D,
	RW_TEXTURE_1D_ARRAY,
	RW_TEXTURE_2D,
	RW_TEXTURE_2D_ARRAY,
	RW_TEXTURE_3D,
	STRUCTURED_BUFFER,
	SUBPASS_INPUT,
	SUBPASS_INPUT_MS,
	TEXTURE_1D,
	TEXTURE_1D_ARRAY,
	TEXTURE_2D,
	TEXTURE_2D_ARRAY,
	TEXTURE_2DMS,
	TEXTURE_2DMS_ARRAY,
	TEXTURE_3D,
	TEXTURE_BUFFER,
	TEXTURE_CUBE,
	TEXTURE_CUBE_ARRAY,
}

ResourceType :: enum i32 {
	UNDEFINED = 0x00000000,
	SAMPLER   = 0x00000001,
	CBV       = 0x00000002,
	SRV       = 0x00000004,
	UAV       = 0x00000008,
}

Format :: enum i32 {
	UNDEFINED           = 0, // = VK_FORMAT_UNDEFINED
	R16_UINT            = 74, // = VK_FORMAT_R16_UINT
	R16_SINT            = 75, // = VK_FORMAT_R16_SINT
	R16_SFLOAT          = 76, // = VK_FORMAT_R16_SFLOAT
	R16G16_UINT         = 81, // = VK_FORMAT_R16G16_UINT
	R16G16_SINT         = 82, // = VK_FORMAT_R16G16_SINT
	R16G16_SFLOAT       = 83, // = VK_FORMAT_R16G16_SFLOAT
	R16G16B16_UINT      = 88, // = VK_FORMAT_R16G16B16_UINT
	R16G16B16_SINT      = 89, // = VK_FORMAT_R16G16B16_SINT
	R16G16B16_SFLOAT    = 90, // = VK_FORMAT_R16G16B16_SFLOAT
	R16G16B16A16_UINT   = 95, // = VK_FORMAT_R16G16B16A16_UINT
	R16G16B16A16_SINT   = 96, // = VK_FORMAT_R16G16B16A16_SINT
	R16G16B16A16_SFLOAT = 97, // = VK_FORMAT_R16G16B16A16_SFLOAT
	R32_UINT            = 98, // = VK_FORMAT_R32_UINT
	R32_SINT            = 99, // = VK_FORMAT_R32_SINT
	R32_SFLOAT          = 100, // = VK_FORMAT_R32_SFLOAT
	R32G32_UINT         = 101, // = VK_FORMAT_R32G32_UINT
	R32G32_SINT         = 102, // = VK_FORMAT_R32G32_SINT
	R32G32_SFLOAT       = 103, // = VK_FORMAT_R32G32_SFLOAT
	R32G32B32_UINT      = 104, // = VK_FORMAT_R32G32B32_UINT
	R32G32B32_SINT      = 105, // = VK_FORMAT_R32G32B32_SINT
	R32G32B32_SFLOAT    = 106, // = VK_FORMAT_R32G32B32_SFLOAT
	R32G32B32A32_UINT   = 107, // = VK_FORMAT_R32G32B32A32_UINT
	R32G32B32A32_SINT   = 108, // = VK_FORMAT_R32G32B32A32_SINT
	R32G32B32A32_SFLOAT = 109, // = VK_FORMAT_R32G32B32A32_SFLOAT
	R64_UINT            = 110, // = VK_FORMAT_R64_UINT
	R64_SINT            = 111, // = VK_FORMAT_R64_SINT
	R64_SFLOAT          = 112, // = VK_FORMAT_R64_SFLOAT
	R64G64_UINT         = 113, // = VK_FORMAT_R64G64_UINT
	R64G64_SINT         = 114, // = VK_FORMAT_R64G64_SINT
	R64G64_SFLOAT       = 115, // = VK_FORMAT_R64G64_SFLOAT
	R64G64B64_UINT      = 116, // = VK_FORMAT_R64G64B64_UINT
	R64G64B64_SINT      = 117, // = VK_FORMAT_R64G64B64_SINT
	R64G64B64_SFLOAT    = 118, // = VK_FORMAT_R64G64B64_SFLOAT
	R64G64B64A64_UINT   = 119, // = VK_FORMAT_R64G64B64A64_UINT
	R64G64B64A64_SINT   = 120, // = VK_FORMAT_R64G64B64A64_SINT
	R64G64B64A64_SFLOAT = 121, // = VK_FORMAT_R64G64B64A64_SFLOAT
}

VariableFlag :: enum u32 {
	NONE                  = 0,
	UNUSED                = 1,
	PHYSICAL_POINTER_COPY = 2,
}
VariableFlags :: bit_set[VariableFlag;u32]

DescriptorType :: enum i32 {
	SAMPLER                    = 0, // = VK_DESCRIPTOR_TYPE_SAMPLER
	COMBINED_IMAGE_SAMPLER     = 1, // = VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER
	SAMPLED_IMAGE              = 2, // = VK_DESCRIPTOR_TYPE_SAMPLED_IMAGE
	STORAGE_IMAGE              = 3, // = VK_DESCRIPTOR_TYPE_STORAGE_IMAGE
	UNIFORM_TEXEL_BUFFER       = 4, // = VK_DESCRIPTOR_TYPE_UNIFORM_TEXEL_BUFFER
	STORAGE_TEXEL_BUFFER       = 5, // = VK_DESCRIPTOR_TYPE_STORAGE_TEXEL_BUFFER
	UNIFORM_BUFFER             = 6, // = VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER
	STORAGE_BUFFER             = 7, // = VK_DESCRIPTOR_TYPE_STORAGE_BUFFER
	UNIFORM_BUFFER_DYNAMIC     = 8, // = VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER_DYNAMIC
	STORAGE_BUFFER_DYNAMIC     = 9, // = VK_DESCRIPTOR_TYPE_STORAGE_BUFFER_DYNAMIC
	INPUT_ATTACHMENT           = 10, // = VK_DESCRIPTOR_TYPE_INPUT_ATTACHMENT
	ACCELERATION_STRUCTURE_KHR = 1000150000, // = VK_DESCRIPTOR_TYPE_ACCELERATION_STRUCTURE_KHR
}

ShaderStageFlag :: enum u32 {
	VERTEX_BIT                  = 1, // = VK_SHADER_STAGE_VERTEX_BIT
	TESSELLATION_CONTROL_BIT    = 2, // = VK_SHADER_STAGE_TESSELLATION_CONTROL_BIT
	TESSELLATION_EVALUATION_BIT = 3, // = VK_SHADER_STAGE_TESSELLATION_EVALUATION_BIT
	GEOMETRY_BIT                = 4, // = VK_SHADER_STAGE_GEOMETRY_BIT
	FRAGMENT_BIT                = 5, // = VK_SHADER_STAGE_FRAGMENT_BIT
	COMPUTE_BIT                 = 6, // = VK_SHADER_STAGE_COMPUTE_BIT
	TASK_BIT_NV                 = 7, // = VK_SHADER_STAGE_TASK_BIT_NV
	TASK_BIT_EXT                = ShaderStageFlag.TASK_BIT_NV, // = VK_SHADER_STAGE_CALLABLE_BIT_EXT
	MESH_BIT_NV                 = 8, // = VK_SHADER_STAGE_MESH_BIT_NV
	MESH_BIT_EXT                = ShaderStageFlag.MESH_BIT_NV, // = VK_SHADER_STAGE_CALLABLE_BIT_EXT
	RAYGEN_BIT_KHR              = 9, // = VK_SHADER_STAGE_RAYGEN_BIT_KHR
	ANY_HIT_BIT_KHR             = 10, // = VK_SHADER_STAGE_ANY_HIT_BIT_KHR
	CLOSEST_HIT_BIT_KHR         = 11, // = VK_SHADER_STAGE_CLOSEST_HIT_BIT_KHR
	MISS_BIT_KHR                = 12, // = VK_SHADER_STAGE_MISS_BIT_KHR
	INTERSECTION_BIT_KHR        = 13, // = VK_SHADER_STAGE_INTERSECTION_BIT_KHR
	CALLABLE_BIT_KHR            = 14, // = VK_SHADER_STAGE_CALLABLE_BIT_KHR
}
ShaderStageFlags :: bit_set[ShaderStageFlag;u32]

Generator :: enum u32 {
	KHRONOS_LLVM_SPIRV_TRANSLATOR         = 6,
	KHRONOS_SPIRV_TOOLS_ASSEMBLER         = 7,
	KHRONOS_GLSLANG_REFERENCE_FRONT_END   = 8,
	GOOGLE_SHADERC_OVER_GLSLANG           = 13,
	GOOGLE_SPIREGG                        = 14,
	GOOGLE_RSPIRV                         = 15,
	X_LEGEND_MESA_MESAIR_SPIRV_TRANSLATOR = 16,
	KHRONOS_SPIRV_TOOLS_LINKER            = 17,
	WINE_VKD3D_SHADER_COMPILER            = 18,
	CLAY_CLAY_SHADER_COMPILER             = 19,
	SLANG_SHADER_COMPILER                 = 40,
}

MAX_ARRAY_DIMS :: 32
MAX_DESCRIPTOR_SETS :: 64

BINDING_NUMBER_DONT_CHANGE :: ~0
SET_NUMBER_DONT_CHANGE :: ~0

Scalar :: struct {
	width:      u32,
	signedness: u32,
}

Vector :: struct {
	component_count: u32,
}

Matrix :: struct {
	column_count: u32,
	row_count:    u32,
	stride:       u32, // Measured in bytes
}

NumericTraits :: struct {
	scalar:  Scalar,
	vector:  Vector,
	matrix_: Matrix,
}

ImageTraits :: struct {
	dim:          Dim,
	depth:        u32,
	arrayed:      u32,
	ms:           u32, // 0: single-sampled; 1: multisampled
	sampled:      u32,
	image_format: ImageFormat,
}

ArrayDimType :: enum i32 {
	RUNTIME = 0, // OpTypeRuntimeArray
}

ArrayTraits :: struct {
	dims_count:           u32,
	dims:                 [MAX_ARRAY_DIMS]u32,
	spec_constant_op_ids: [MAX_ARRAY_DIMS]u32,
	stride:               u32,
}

BindingArrayTraits :: struct {
	dims_count: u32,
	dims:       [MAX_ARRAY_DIMS]u32,
}

Traits :: struct {
	numeric: NumericTraits,
	image:   ImageTraits,
	array:   ArrayTraits,
}

TypeDescription :: struct {
	id:                      u32,
	op:                      Op,
	type_name:               cstring,
	struct_member_name:      cstring,
	storage_class:           i32,
	type_flags:              TypeFlags,
	decoration_flags:        DecorationFlags,
	traits:                  Traits,
	struct_type_description: ^TypeDescription,
	copied:                  u32,
	member_count:            u32, // DEPRECATED, use struct_type_description instead.
	members:                 [^]TypeDescription, // DEPRECATED, use struct_type_description instead.
}

InterfaceVariable :: struct {
	spirv_id:         u32,
	name:             cstring,
	location:         u32,
	component:        u32,
	storage_class:    StorageClass,
	semantic:         cstring,
	decoration_flags: DecorationFlags,
	built_in:         i32,
	numeric:          NumericTraits,
	array:            ArrayTraits,
	member_count:     u32,
	members:          [^]InterfaceVariable,
	format:           Format,
	type_description: ^TypeDescription,
	word_offset:      u32, // NOTE: Originally shadowed by an array, change if necessary.
}

BlockVariable :: struct {
	spirv_id:         u32,
	name:             cstring,
	offset:           u32,
	absolute_offset:  u32,
	size:             u32,
	padded_size:      u32,
	decoration_flags: DecorationFlags,
	numeric:          NumericTraits,
	array:            ArrayTraits,
	flags:            VariableFlags,
	member_count:     u32,
	members:          [^]BlockVariable,
	type_description: ^TypeDescription,
	word_offset:      u32,
}

DescriptorBinding :: struct {
	spirv_id:                         u32,
	name:                             cstring,
	binding:                          u32,
	input_attachment_index:           u32,
	set:                              u32,
	descriptor_type:                  DescriptorType,
	resource_type:                    ResourceType,
	image:                            ImageTraits,
	block:                            BlockVariable,
	array:                            BindingArrayTraits,
	count:                            u32,
	accessed:                         u32,
	uav_counter_id:                   u32,
	uav_counter_binding:              ^DescriptorBinding,
	byte_address_buffer_offset_count: u32,
	byte_address_buffer_offsets:      [^]u32,
	type_description:                 ^TypeDescription,
	word_offset_binding:              u32,
	word_offset_set:                  u32,
	decoration_flags:                 DecorationFlags,
	user_type:                        UserType,
}

DescriptorSet :: struct {
	set:           u32,
	binding_count: u32,
	bindings:      [^]^DescriptorBinding,
}

ExecutionModeValue :: enum i32 {
	SPEC_CONSTANT = 0xFFFFFFFF,
}

LocalSize :: struct {
	x: u32,
	y: u32,
	z: u32,
}

EntryPoint :: struct {
	name:                     cstring,
	id:                       u32,
	spirv_execution_model:    ExecutionModel,
	shader_stage:             ShaderStageFlags,
	input_variable_count:     u32,
	input_variables:          [^]InterfaceVariable,
	output_variable_count:    u32,
	output_variables:         [^]InterfaceVariable,
	interface_variable_count: u32,
	interface_variables:      [^]InterfaceVariable,
	descriptor_set_count:     u32,
	descriptor_sets:          [^]DescriptorSet,
	used_uniform_count:       u32,
	used_uniforms:            [^]u32,
	used_push_constant_count: u32,
	used_push_constants:      [^]u32,
	execution_mode_count:     u32,
	execution_modes:          [^]ExecutionMode,
	local_size:               LocalSize,
	invocations:              u32, // Valid for geometry
	output_vertices:          u32, // Valid for geometry, tesselation
}

ReflectCapability :: struct {
	value:       Capability,
	word_offset: u32,
}

SpecializationConstant :: struct {
	spirv_id:           u32,
	constant_id:        u32,
	name:               cstring,
	type_description:   ^TypeDescription,
	default_value_size: u32,
	default_value:      rawptr,
}

Internal :: struct {
	module_flags:           ModuleFlags,
	spirv_size:             int,
	spirv_code:             [^]u32,
	spirv_word_count:       u32,
	type_description_count: u32,
	type_descriptions:      [^]TypeDescription,
}

ShaderModule :: struct {
	generator:                 Generator,
	entry_point_name:          cstring,
	entry_point_id:            u32,
	entry_point_count:         u32,
	entry_points:              [^]EntryPoint,
	source_language:           SourceLanguage,
	source_language_version:   u32,
	source_file:               cstring,
	source_source:             cstring,
	capability_count:          u32,
	capabilities:              [^]ReflectCapability,
	spirv_execution_model:     ExecutionModel,
	shader_stage:              ShaderStageFlags,
	descriptor_binding_count:  u32,
	descriptor_bindings:       [^]DescriptorBinding,
	descriptor_set_count:      u32,
	descriptor_sets:           [MAX_DESCRIPTOR_SETS]DescriptorSet,
	input_variable_count:      u32,
	input_variables:           [^]^InterfaceVariable,
	output_variable_count:     u32,
	output_variables:          [^]^InterfaceVariable,
	interface_variable_count:  u32,
	interface_variables:       [^]InterfaceVariable,
	push_constant_block_count: u32,
	push_constant_blocks:      [^]BlockVariable,
	spec_constant_count:       u32,
	spec_constants:            [^]SpecializationConstant,
	_internal:                 ^Internal,
}

@(default_calling_convention = "c", link_prefix = "spvReflect", require_results)
foreign lib {
	CreateShaderModule :: proc(size: int, p_code: rawptr, p_module: ^ShaderModule) -> Result ---
	CreateShaderModule2 :: proc(flags: ModuleFlags, size: int, p_code: rawptr, p_module: ^ShaderModule) -> Result ---
	DestroyShaderModule :: proc(p_module: ^ShaderModule) ---
	GetCodeSize :: proc(#by_ptr p_module: ShaderModule) -> u32 ---
	GetCode :: proc(#by_ptr p_module: ShaderModule) -> [^]u32 ---
	GetEntryPoint :: proc(#by_ptr p_module: ShaderModule, entry_point: cstring) -> ^EntryPoint ---
	EnumerateDescriptorBindings :: proc(#by_ptr p_module: ShaderModule, p_count: ^u32, pp_bindings: [^]^DescriptorBinding) -> Result ---
	EnumerateEntryPointDescriptorBindings :: proc(#by_ptr p_module: ShaderModule, entry_point: cstring, p_count: ^u32, pp_bindings: [^]^DescriptorBinding) -> Result ---
	EnumerateDescriptorSets :: proc(#by_ptr p_module: ShaderModule, p_count: ^u32, pp_sets: [^]^DescriptorSet) -> Result ---
	EnumerateEntryPointDescriptorSets :: proc(#by_ptr p_module: ShaderModule, entry_point: cstring, p_count: ^u32, pp_sets: [^]^DescriptorSet) -> Result ---
	EnumerateInterfaceVariables :: proc(#by_ptr p_module: ShaderModule, p_count: ^u32, pp_variables: [^]^InterfaceVariable) -> Result ---
	EnumerateEntryPointInterfaceVariables :: proc(#by_ptr p_module: ShaderModule, entry_point: cstring, p_count: ^u32, pp_variables: [^]^InterfaceVariable) -> Result ---
	EnumerateInputVariables :: proc(#by_ptr p_module: ShaderModule, p_count: ^u32, pp_variables: [^]^InterfaceVariable) -> Result ---
	EnumerateEntryPointInputVariables :: proc(#by_ptr p_module: ShaderModule, entry_point: cstring, p_count: ^u32, pp_variables: [^]^InterfaceVariable) -> Result ---
	EnumerateOutputVariables :: proc(#by_ptr p_module: ShaderModule, p_count: ^u32, pp_variables: [^]^InterfaceVariable) -> Result ---
	EnumerateEntryPointOutputVariables :: proc(#by_ptr p_module: ShaderModule, entry_point: cstring, p_count: ^u32, pp_variables: [^]^InterfaceVariable) -> Result ---
	EnumeratePushConstantBlocks :: proc(#by_ptr p_module: ShaderModule, p_count: ^u32, pp_blocks: [^]^BlockVariable) -> Result ---
	EnumerateEntryPointPushConstantBlocks :: proc(#by_ptr p_module: ShaderModule, entry_point: cstring, p_count: ^u32, pp_blocks: [^]^BlockVariable) -> Result ---
	EnumerateSpecializationConstants :: proc(#by_ptr p_module: ShaderModule, p_count: ^u32, pp_constants: [^]^SpecializationConstant) -> Result ---
	GetDescriptorBinding :: proc(#by_ptr p_module: ShaderModule, binding_number: u32, set_number: u32, p_result: ^Result) -> ^DescriptorBinding ---
	GetEntryPointDescriptorBinding :: proc(#by_ptr p_module: ShaderModule, entry_point: cstring, binding_number: u32, set_number: u32, p_result: ^Result) -> ^DescriptorBinding ---
	GetDescriptorSet :: proc(#by_ptr p_module: ShaderModule, set_number: u32, p_result: ^Result) -> ^DescriptorSet ---
	GetEntryPointDescriptorSet :: proc(#by_ptr p_module: ShaderModule, entry_point: cstring, set_number: u32, p_result: ^Result) -> ^DescriptorSet ---
	GetInputVariableByLocation :: proc(#by_ptr p_module: ShaderModule, location: u32, p_result: ^Result) -> ^InterfaceVariable ---
	GetEntryPointInputVariableByLocation :: proc(#by_ptr p_module: ShaderModule, entry_point: cstring, location: u32, p_result: ^Result) -> ^InterfaceVariable ---
	GetInputVariableBySemantic :: proc(#by_ptr p_module: ShaderModule, semantic: cstring, p_result: ^Result) -> ^InterfaceVariable ---
	GetEntryPointInputVariableBySemantic :: proc(#by_ptr p_module: ShaderModule, entry_point: cstring, semantic: cstring, p_result: ^Result) -> ^InterfaceVariable ---
	GetOutputVariableByLocation :: proc(#by_ptr p_module: ShaderModule, location: u32, p_result: ^Result) -> ^InterfaceVariable ---
	GetEntryPointOutputVariableByLocation :: proc(#by_ptr p_module: ShaderModule, entry_point: cstring, location: u32, p_result: ^Result) -> ^InterfaceVariable ---
	GetOutputVariableBySemantic :: proc(#by_ptr p_module: ShaderModule, semantic: cstring, p_result: ^Result) -> ^InterfaceVariable ---
	GetEntryPointOutputVariableBySemantic :: proc(#by_ptr p_module: ShaderModule, entry_point: cstring, semantic: cstring, p_result: ^Result) -> ^InterfaceVariable ---
	GetPushConstantBlock :: proc(#by_ptr p_module: ShaderModule, index: u32, p_result: ^Result) -> ^BlockVariable ---
	GetEntryPointPushConstantBlock :: proc(#by_ptr p_module: ShaderModule, entry_point: cstring, p_result: ^Result) -> ^BlockVariable ---
	ChangeDescriptorBindingNumbers :: proc(p_module: ^ShaderModule, #by_ptr p_binding: DescriptorBinding, new_binding_number: u32, new_set_number: u32) -> Result ---
	ChangeDescriptorSetNumber :: proc(p_module: ^ShaderModule, #by_ptr p_set: DescriptorSet, new_set_number: u32) -> Result ---
	ChangeInputVariableLocation :: proc(p_module: ^ShaderModule, #by_ptr p_input_variable: InterfaceVariable, new_location: u32) -> Result ---
	ChangeOutputVariableLocation :: proc(p_module: ^ShaderModule, #by_ptr p_output_variable: InterfaceVariable, new_location: u32) -> Result ---
	BlockVariableTypeName :: proc(#by_ptr p_var: BlockVariable) -> cstring ---
}

@(default_calling_convention = "c", link_prefix = "spv", require_results)
foreign lib {
	ReflectSourceLanguage :: proc(source_lang: SourceLanguage) -> cstring ---
}
