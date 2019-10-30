package ru.ithex.mdmmodel;

import javax.persistence.*;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import static ru.ithex.mdmmodel.utils.Serialization.*;

@Entity
@Table(name = "action_result")
public class ActionResult implements Externalizable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "action_result_id")
    private Integer id;

    @Column(name = "action_result_name")
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void writeExternal(ObjectOutput out) throws IOException {
        writeNullableObject(out, id);
        writeNullableObject(out, name);
    }

    public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
        id = readIntFromObjectInput(in);
        name = readStringFromObjectInput(in);
    }
}
