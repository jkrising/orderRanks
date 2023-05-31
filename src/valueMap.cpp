#include "valueMap.h"

#include <Rcpp.h>
#include <sstream>

#include "misc.h"

std::string valueMap::toString() const {
  std::stringstream ss;
  for (auto it : m_map) {
    auto k = it.first;
    auto v = it.second;
    ss << "Value: " << k << std::endl
       << "Data: " << std::endl
       << "\tleft: [" << join(v.left(), ", ") << "]" << std::endl
       << "\tright: [" << join(v.right(), ", ") << "]" << std::endl;
  }
  return ss.str();
}

valueMap valueMap::makeValueMap(const Rcpp::NumericVector &left,
                                const Rcpp::NumericVector &right) {
  valueMap vmap;
  for (unsigned int i = 0; i < left.size(); i++) {
    vmap.map()[left[i]].left().push_back(i);
  }

  for (unsigned int i = 0; i < right.size(); i++) {
    vmap.map()[right[i]].right().push_back(i);
  }

  return vmap;
}
