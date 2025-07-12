package com.janitor.api.repository;
import com.janitor.api.entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;

public interface Person extends JpaRepository<Room, Long> {
}
