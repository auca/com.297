using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BulletController : MonoBehaviour
{
    public float forceScale = 0.3f;
    
    public Vector3 direction = Vector3.forward;
    
    private Rigidbody _rigidBody;
    
    void Start()
    {
        _rigidBody = GetComponent<Rigidbody>();
    }

    void Update()
    {
        _rigidBody.AddForce(direction * forceScale);
    }
}
