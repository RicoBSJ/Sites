package entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
public class MultiPitch extends Route implements Serializable {


    @Column(name = "number_of_pitch")
    private int numberOfPitch;

    public int getNumberOfPitch() {
        return numberOfPitch;
    }

    public void setNumberOfPitch(int numberOfPitch) {
        this.numberOfPitch = numberOfPitch;
    }


}
