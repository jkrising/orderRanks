// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#ifndef RCPP_orderRanks_RCPPEXPORTS_H_GEN_
#define RCPP_orderRanks_RCPPEXPORTS_H_GEN_

#include <Rcpp.h>

namespace orderRanks {

    using namespace Rcpp;

    namespace {
        void validateSignature(const char* sig) {
            Rcpp::Function require = Rcpp::Environment::base_env()["require"];
            require("orderRanks", Rcpp::Named("quietly") = true);
            typedef int(*Ptr_validate)(const char*);
            static Ptr_validate p_validate = (Ptr_validate)
                R_GetCCallable("orderRanks", "_orderRanks_RcppExport_validate");
            if (!p_validate(sig)) {
                throw Rcpp::function_not_exported(
                    "C++ function with signature '" + std::string(sig) + "' not found in orderRanks");
            }
        }
    }

    inline bool getCompatibility(const Rcpp::IntegerVector& ranking, const Rcpp::NumericVector& left, const Rcpp::NumericVector& right) {
        typedef SEXP(*Ptr_getCompatibility)(SEXP,SEXP,SEXP);
        static Ptr_getCompatibility p_getCompatibility = NULL;
        if (p_getCompatibility == NULL) {
            validateSignature("bool(*getCompatibility)(const Rcpp::IntegerVector&,const Rcpp::NumericVector&,const Rcpp::NumericVector&)");
            p_getCompatibility = (Ptr_getCompatibility)R_GetCCallable("orderRanks", "_orderRanks_getCompatibility");
        }
        RObject rcpp_result_gen;
        {
            RNGScope RCPP_rngScope_gen;
            rcpp_result_gen = p_getCompatibility(Shield<SEXP>(Rcpp::wrap(ranking)), Shield<SEXP>(Rcpp::wrap(left)), Shield<SEXP>(Rcpp::wrap(right)));
        }
        if (rcpp_result_gen.inherits("interrupted-error"))
            throw Rcpp::internal::InterruptedException();
        if (Rcpp::internal::isLongjumpSentinel(rcpp_result_gen))
            throw Rcpp::LongjumpException(rcpp_result_gen);
        if (rcpp_result_gen.inherits("try-error"))
            throw Rcpp::exception(Rcpp::as<std::string>(rcpp_result_gen).c_str());
        return Rcpp::as<bool >(rcpp_result_gen);
    }

    inline double getRankDistance(const Rcpp::IntegerVector& r1, const Rcpp::IntegerVector& r2) {
        typedef SEXP(*Ptr_getRankDistance)(SEXP,SEXP);
        static Ptr_getRankDistance p_getRankDistance = NULL;
        if (p_getRankDistance == NULL) {
            validateSignature("double(*getRankDistance)(const Rcpp::IntegerVector&,const Rcpp::IntegerVector&)");
            p_getRankDistance = (Ptr_getRankDistance)R_GetCCallable("orderRanks", "_orderRanks_getRankDistance");
        }
        RObject rcpp_result_gen;
        {
            RNGScope RCPP_rngScope_gen;
            rcpp_result_gen = p_getRankDistance(Shield<SEXP>(Rcpp::wrap(r1)), Shield<SEXP>(Rcpp::wrap(r2)));
        }
        if (rcpp_result_gen.inherits("interrupted-error"))
            throw Rcpp::internal::InterruptedException();
        if (Rcpp::internal::isLongjumpSentinel(rcpp_result_gen))
            throw Rcpp::LongjumpException(rcpp_result_gen);
        if (rcpp_result_gen.inherits("try-error"))
            throw Rcpp::exception(Rcpp::as<std::string>(rcpp_result_gen).c_str());
        return Rcpp::as<double >(rcpp_result_gen);
    }

    inline Rcpp::DataFrame getRankIntervals(const Rcpp::NumericVector& left, const Rcpp::NumericVector& right) {
        typedef SEXP(*Ptr_getRankIntervals)(SEXP,SEXP);
        static Ptr_getRankIntervals p_getRankIntervals = NULL;
        if (p_getRankIntervals == NULL) {
            validateSignature("Rcpp::DataFrame(*getRankIntervals)(const Rcpp::NumericVector&,const Rcpp::NumericVector&)");
            p_getRankIntervals = (Ptr_getRankIntervals)R_GetCCallable("orderRanks", "_orderRanks_getRankIntervals");
        }
        RObject rcpp_result_gen;
        {
            RNGScope RCPP_rngScope_gen;
            rcpp_result_gen = p_getRankIntervals(Shield<SEXP>(Rcpp::wrap(left)), Shield<SEXP>(Rcpp::wrap(right)));
        }
        if (rcpp_result_gen.inherits("interrupted-error"))
            throw Rcpp::internal::InterruptedException();
        if (Rcpp::internal::isLongjumpSentinel(rcpp_result_gen))
            throw Rcpp::LongjumpException(rcpp_result_gen);
        if (rcpp_result_gen.inherits("try-error"))
            throw Rcpp::exception(Rcpp::as<std::string>(rcpp_result_gen).c_str());
        return Rcpp::as<Rcpp::DataFrame >(rcpp_result_gen);
    }

}

#endif // RCPP_orderRanks_RCPPEXPORTS_H_GEN_
