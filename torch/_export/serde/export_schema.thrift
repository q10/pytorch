// @generated by update_schema.py
// checksum<<31664e4faa0eacd6f538ffed163078e190d9d2b98d762dd45b68eb1b7b12f0d1>>

namespace py3 torch._export
namespace cpp2 torch._export.schema

enum ArgumentKind {
  UNKNOWN = 0,
  POSITIONAL = 1,
  KEYWORD = 2,
}


enum Layout {
  Unknown = 0,
  SparseCoo = 1,
  SparseCsr = 2,
  SparseCsc = 3,
  SparseBsr = 4,
  SparseBsc = 5,
  _mkldnn = 6,
  Strided = 7,
}


enum MemoryFormat {
  Unknown = 0,
  ContiguousFormat = 1,
  ChannelsLast = 2,
  ChannelsLast3d = 3,
  PreserveFormat = 4,
}


enum ScalarType {
  UNKNOWN = 0,
  BYTE = 1,
  CHAR = 2,
  SHORT = 3,
  INT = 4,
  LONG = 5,
  HALF = 6,
  FLOAT = 7,
  DOUBLE = 8,
  COMPLEXHALF = 9,
  COMPLEXFLOAT = 10,
  COMPLEXDOUBLE = 11,
  BOOL = 12,
  BFLOAT16 = 13,
  UINT16 = 28,
  FLOAT8E4M3FN = 29,
  FLOAT8E5M2 = 30,
  FLOAT8E4M3FNUZ = 31,
  FLOAT8E5M2FNUZ = 32,
}


struct Device {
  10: string type;
  20: optional i64 index;
}

union SymExprHint {
  10: i64 as_int;
  20: bool as_bool;
  30: double as_float;
}

struct SymExpr {
  10: string expr_str;
  20: optional SymExprHint hint;
}

union SymInt {
  10: SymExpr as_expr;
  20: i64 as_int;
}

union SymFloat {
  10: SymExpr as_expr;
  20: double as_float;
}

union SymBool {
  10: SymExpr as_expr;
  20: bool as_bool;
}

struct TensorMeta {
  10: ScalarType dtype;
  20: list<SymInt> sizes;
  30: bool requires_grad;
  40: Device device;
  50: list<SymInt> strides;
  60: SymInt storage_offset;
  70: Layout layout;
}

union SymIntArgument {
  10: string as_name;
  20: i64 as_int;
}

union SymFloatArgument {
  10: string as_name;
  20: double as_float;
}

union SymBoolArgument {
  10: string as_name;
  20: bool as_bool;
}

struct TensorArgument {
  10: string name;
}

struct TokenArgument {
  10: string name;
}

union OptionalTensorArgument {
  20: TensorArgument as_tensor;
  10: bool as_none;
}

struct GraphArgument {
  10: string name;
  20: Graph graph;
}

struct CustomObjArgument {
  10: string name;
  20: string class_fqn;
}

union Argument {
  10: bool as_none;
  20: TensorArgument as_tensor;
  30: list<TensorArgument> as_tensors;
  50: i64 as_int;
  70: list<i64> as_ints;
  80: double as_float;
  90: list<double> as_floats;
  100: string as_string;
  101: list<string> as_strings;
  110: SymIntArgument as_sym_int;
  120: list<SymIntArgument> as_sym_ints;
  130: ScalarType as_scalar_type;
  140: MemoryFormat as_memory_format;
  150: Layout as_layout;
  160: Device as_device;
  170: bool as_bool;
  180: list<bool> as_bools;
  182: SymBoolArgument as_sym_bool;
  184: list<SymBoolArgument> as_sym_bools;
  200: GraphArgument as_graph;
  190: list<OptionalTensorArgument> as_optional_tensors;
  210: CustomObjArgument as_custom_obj;
  220: string as_operator;
  230: SymFloatArgument as_sym_float;
  240: list<SymFloatArgument> as_sym_floats;
  250: OptionalTensorArgument as_optional_tensor;
}

struct NamedArgument {
  10: string name;
  20: Argument arg;
  30: optional ArgumentKind kind;
}

struct Node {
  10: string target;
  20: list<NamedArgument> inputs;
  30: list<Argument> outputs;
  40: map<string, string> metadata;
  50: optional bool is_hop_single_tensor_return;
}

struct Graph {
  10: list<Argument> inputs;
  20: list<Argument> outputs;
  30: list<Node> nodes;
  40: map<string, TensorMeta> tensor_values;
  50: map<string, SymInt> sym_int_values;
  60: map<string, SymBool> sym_bool_values;
  70: bool is_single_tensor_return;
  80: map<string, CustomObjArgument> custom_obj_values;
  90: map<string, SymFloat> sym_float_values;
}

struct UserInputSpec {
  10: Argument arg;
}

union ConstantValue {
  10: bool as_none;
  20: i64 as_int;
  30: double as_float;
  40: string as_string;
  50: bool as_bool;
}

struct InputToConstantInputSpec {
  10: string name;
  20: ConstantValue value;
}

struct InputToParameterSpec {
  10: TensorArgument arg;
  20: string parameter_name;
}

struct InputToBufferSpec {
  10: TensorArgument arg;
  20: string buffer_name;
  30: bool persistent;
}

struct InputToTensorConstantSpec {
  10: TensorArgument arg;
  20: string tensor_constant_name;
}

struct InputToCustomObjSpec {
  10: CustomObjArgument arg;
  20: string custom_obj_name;
}

struct InputTokenSpec {
  10: TokenArgument arg;
}

union InputSpec {
  10: UserInputSpec user_input;
  20: InputToParameterSpec parameter;
  30: InputToBufferSpec buffer;
  40: InputToTensorConstantSpec tensor_constant;
  50: InputToCustomObjSpec custom_obj;
  70: InputTokenSpec token;
  60: InputToConstantInputSpec constant_input;
}

struct UserOutputSpec {
  10: Argument arg;
}

struct LossOutputSpec {
  10: TensorArgument arg;
}

struct BufferMutationSpec {
  10: TensorArgument arg;
  20: string buffer_name;
}

struct GradientToParameterSpec {
  10: TensorArgument arg;
  20: string parameter_name;
}

struct GradientToUserInputSpec {
  10: TensorArgument arg;
  20: string user_input_name;
}

struct UserInputMutationSpec {
  10: TensorArgument arg;
  20: string user_input_name;
}

struct OutputTokenSpec {
  10: TokenArgument arg;
}

union OutputSpec {
  10: UserOutputSpec user_output;
  20: LossOutputSpec loss_output;
  30: BufferMutationSpec buffer_mutation;
  40: GradientToParameterSpec gradient_to_parameter;
  50: GradientToUserInputSpec gradient_to_user_input;
  60: UserInputMutationSpec user_input_mutation;
  70: OutputTokenSpec token;
}

struct GraphSignature {
  10: list<InputSpec> input_specs;
  20: list<OutputSpec> output_specs;
}

struct RangeConstraint {
  10: optional i64 min_val;
  20: optional i64 max_val;
}

struct ModuleCallSignature {
  10: list<Argument> inputs;
  20: list<Argument> outputs;
  30: string in_spec;
  40: string out_spec;
  50: optional list<string> forward_arg_names;
}

struct ModuleCallEntry {
  10: string fqn;
  30: optional ModuleCallSignature signature;
}

struct NamedTupleDef {
  10: list<string> field_names;
}

struct GraphModule {
  10: Graph graph;
  50: GraphSignature signature;
  60: list<ModuleCallEntry> module_call_graph;
  40: map<string, string> metadata;
  70: map<string, NamedTupleDef> treespec_namedtuple_fields;
}

struct SchemaVersion {
  10: i64 major;
  20: i64 minor;
}

struct ExportedProgram {
  10: GraphModule graph_module;
  20: map<string, i64> opset_version;
  30: map<string, RangeConstraint> range_constraints;
  60: SchemaVersion schema_version;
  70: list<string> verifiers;
  80: string torch_version;
}

struct Program {
  200: map<string, ExportedProgram> methods;
}

struct Model {
  10: string name;
  20: map<string, string> tensorPaths;
  40: Program program;
  50: map<string, Program> delegates;
  60: map<string, string> deviceAllocationMap;
  70: map<string, string> constantPaths;
}

struct AOTInductorModelPickleData {
  1: string library_basename;
  2: list<string> input_names;
  3: list<string> output_names;
  4: optional i64 floating_point_input_dtype;
  5: optional i64 floating_point_output_dtype;
  6: optional bool aot_inductor_model_is_cpu;
}

struct ExternKernelNode {
  10: string name;
  20: Node node;
}

struct ExternKernelNodes {
  10: list<ExternKernelNode> nodes;
}
