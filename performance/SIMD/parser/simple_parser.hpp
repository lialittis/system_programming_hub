#include <string>
#include <map>
#include <vector>
#include <memory>

namespace JSON {
class JSONNode;
using JSONObject = std::map<std::string, std::shared_ptr<JSONNode>>;
using JSONList = std::vector<std::shared_ptr<JSONNode>>;

class JSONNode {
  enum class Type { OBJECT, LIST, STRING, NUMBER, BOOLEAN, NULL_TYPE}; // make it private
  union Values {
    JSONObject *object;
    JSONList *list;
    std::string *s;
    float fValue;
    bool bValue;
  } values;
  Type type;
};
/* Node inefficient : 112 bytes*/
class JSONNodeInefficient {
    JSONObject object;      // 
    JSONList list;          //
    std::string s;          // 
    float fValue;           // 
    bool bValue;            // 
};

class JSONNodeSimplePointers {
    JSONObject *object;
    JSONList *list;
    std::string *s;
    float fValue;
    bool bValue;
};
}
