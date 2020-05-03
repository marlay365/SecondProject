package com.java.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.java.dto.HomeDetails;

@Repository
public interface HomeRepository extends CrudRepository<HomeDetails, Integer> {

	@Query("select h from HomeDetails h where h.city = (:city) and h.propertyType = (:p) and ((:av) is null or h.availability = (:av)) and ((:bedr) is null or h.bedrooms = (:bedr)) and ((:rng) is null or h.price >= (:rng) and (:rngtwo) is null or h.price <= (:rngtwo))")
	public List<HomeDetails> findByCityAndPropertyTypeAndBedroomsAndAvailabilityAndPrice(@Param("city") String city, 
			@Param("p")String propType, @Param("av")String availability, @Param("bedr") String bedrooms,
			@Param("rng")Double range1, @Param("rngtwo")Double range2);

	//	public HomeDetails getPropertyDetailsbyId(int id);
	public List<HomeDetails> findByOwnerId(int id);

	@Query("select h from HomeDetails h where h.city = (:city) and h.propertyType = (:p) and ((:av) is null or h.availability = (:av)) and ((:bedr) is null or h.bedrooms = (:bedr)) and ((:rng) is null or h.price >= (:rng) and (:rngtwo) is null or h.price <= (:rngtwo))")
	public List<HomeDetails> findByCityAndPropertyTypeAndBedroomsAndAvailabilityAndPrice(@Param("city") String city, 
			@Param("p")String propType, @Param("av")String availability, @Param("bedr") String bedrooms,
			@Param("rng")String range1, @Param("rngtwo")String range2);
	
}
