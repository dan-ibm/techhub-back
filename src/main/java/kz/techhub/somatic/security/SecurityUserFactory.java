package kz.techhub.somatic.security;


import kz.techhub.somatic.model.entities.RoleEntity;
import kz.techhub.somatic.model.entities.UserEntity;
import kz.techhub.somatic.model.enums.Status;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class SecurityUserFactory {

    public SecurityUserFactory() {
    }

    public static SecurityUser create (UserEntity defaultUser) {
        return new SecurityUser(
                defaultUser.getUsername(),
                defaultUser.getPassword(),
                mapToGrantedAuthorities(new ArrayList<>(defaultUser.getRoles())),
                defaultUser.getStatus().equals(Status.ACTIVE)
        );
    }

    private static List<GrantedAuthority> mapToGrantedAuthorities(List<RoleEntity> userRoles) {
        return userRoles.stream()
                .map(role ->
                        new SimpleGrantedAuthority(role.getRoleName())
                ).collect(Collectors.toList());
    }
}
