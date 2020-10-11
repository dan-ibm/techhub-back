package kz.techhub.somatic.repository;

import kz.techhub.somatic.model.entities.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;


@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long> {

    @Query("select l from UserEntity l where l.username=?1 and l.password=?2")
    UserEntity findByUsernameAndPassword(String username, String password);

    @Query("select l from UserEntity l where l.username=?1")
    Optional<UserEntity> findByUsername(String username);

    @Query(value = "SELECT * FROM users WHERE username=?1 OR iin=?1", nativeQuery = true)
    Optional<UserEntity> findByUsernameOrIin(String login);

    Optional<UserEntity> findByEmail(String email);

}
