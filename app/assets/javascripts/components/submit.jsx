
class Submit extends React.Component {

    constructor(props) {
        super(props);

        this.state = {

        }

        this.setNewNumber = this.setNewNumber.bind(this)
    };

    setNewNumber() {
         console.log("Submit button pressed!")

    }

    render() {
        return (
            <div>
                <button onClick = {this.setNewNumber}>SUBMIT</button>
            </div>
        );
    }
}