#ifndef VALUE_MAP_H
#define VALUE_MAP_H

#include <Rcpp.h>
#include <map>
#include <string>
#include <vector>

class valueMap {
public:
  class valueData {
  public:
    std::vector<unsigned int> &left() { return m_left; };

    std::vector<unsigned int> &right() { return m_right; };

  private:
    std::vector<unsigned int> m_left;
    std::vector<unsigned int> m_right;
  };

  std::map<double, valueData> &map() { return m_map; };

  std::string toString() const;

  static valueMap makeValueMap(const Rcpp::NumericVector &left,
                               const Rcpp::NumericVector &right);

private:
  std::map<double, valueData> m_map;
};

#endif
