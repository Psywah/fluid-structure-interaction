/**
 * @file BioChem.h
 * @brief 
 * @author Shihua Gong
 * @version 
 * @date 30-04-2016
 */

#ifndef __Common_H__
#define __Common_H__ 


enum FacetType : std::size_t { GAMMA_0 = 6, GAMMA_S = 1, GAMMA_M = 2, GAMMA_I = 3,
                                 GAMMA_FI = 4, GAMMA_FO=5, GAMMA_ELSE =10};
enum DomainType : std::size_t {BLOOD = 3, MEDIA = 1, ADVENTITIA = 2, DOMAIN_ELSE = 10,
                                VESSEL = 1}; 


#endif // __Common_H__

/** 
 * end of file 
 *
 */
